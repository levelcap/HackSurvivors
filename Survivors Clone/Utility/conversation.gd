extends Node2D

@onready var characters = {
	"one": {
		"group": get_node("CharacterOneGroup"),
		"text": get_node("CharacterOneGroup/CharacterOneText"),
		"sprite": get_node("CharacterOneGroup/CharacterOne"),
		"text_sprite": get_node("CharacterOneGroup/TextSprite"),
	},
	"two": {
		"group": get_node("CharacterTwoGroup"),
		"text": get_node("CharacterTwoGroup/CharacterTwoText"),
		"sprite": get_node("CharacterOneGroup/CharacterTwo"),
		"text_sprite": get_node("CharacterTwoGroup/TextSprite"),
	}
}

@onready var versus = get_node("Versus")
@onready var player = get_tree().get_first_node_in_group("player")
@onready var whoosh = get_node("snd_whoosh")
@onready var bossBell = get_node("snd_boss")
@onready var blah1 = get_node("snd_blah1")
@onready var blah2 = get_node("snd_blah2")
@onready var bossBg = get_node("BossBackground")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func playText(character_num, text):
	var character = characters[character_num]["group"]
	var characterText = characters[character_num]["text"]
	var characterTextSprite = characters[character_num]["text_sprite"]
	var blah = blah1
	character.visible = true
	characterText.text = text
	characterText.visible_characters = 0;
	characterTextSprite.visible = false
	
	var tween = create_tween()
	if (character_num == "one"):
		tween.tween_property(character, "position", Vector2(5,0), 1)
	else:
		blah = blah2
		tween.tween_property(character, "position", Vector2(-5,0), 1)
		
	tween.play()
	await tween.finished
	characterTextSprite.visible = true
	var textTween = create_tween()
	blah.play()
	textTween.tween_property(characterText, "visible_characters", characterText.text.length(), 2)
	await textTween.finished
	blah.stop()
	await get_tree().create_timer(1.0).timeout
	characterText.visible_characters = 0;
	characterTextSprite.visible = false
	
func bossFight():	
	var characterOne = characters["one"]["group"]
	var characterOneText = characters["one"]["text"]
	var characterOneTextSprite = characters["one"]["text_sprite"]
	var characterTwo = characters["two"]["group"]
	var characterTwoText = characters["two"]["text"]
	var characterTwoTextSprite = characters["two"]["text_sprite"]
	characterOne.position = Vector2(-200, -75)
	characterTwo.position = Vector2(840, -50)
	characterOne.visible = true
	characterOneText.visible = false
	characterOneTextSprite.visible = false
	
	characterTwo.visible = true
	characterTwoText.visible = false
	characterTwoTextSprite.visible = false
	
	var bossBgTween = create_tween()
	var characterOneTween = create_tween()
	var characterTwoTween = create_tween()
	var versusTweeen = create_tween()
	characterOneTween.pause()
	characterTwoTween.pause()
	versusTweeen.pause()
	bossBell.play()
	bossBgTween.tween_property(bossBg, "modulate", Color("ffffff", 1), 1.5)
	characterOneTween.tween_property(characterOne, "position", Vector2(100, -75), 0.25)
	characterTwoTween.tween_property(characterTwo, "position", Vector2(-100, -50), 0.25)
	versusTweeen.tween_property(versus, "global_position", player.global_position, 0.25)
	
	await get_tree().create_timer(1).timeout
	characterOneTween.play()
	whoosh.play()
	await get_tree().create_timer(.5).timeout
	whoosh.stop()
	versusTweeen.play()
	versus.visible = true
	whoosh.play()
	await get_tree().create_timer(.5).timeout
	whoosh.stop()
	characterTwoTween.play()
	whoosh.play()
	await get_tree().create_timer(2.0).timeout

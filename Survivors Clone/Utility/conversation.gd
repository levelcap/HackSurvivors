extends Node2D

@onready var characters = {
	"player": {
		"group": get_node("CharacterOneGroup"),
		"text": get_node("CharacterOneGroup/CharacterOneText"),
		"sprite": get_node("CharacterOneGroup/CharacterOne"),
		"text_sprite": get_node("CharacterOneGroup/TextSprite"),
	},
	"chefboss": {
		"group": get_node("CharacterTwoGroup"),
		"text": get_node("CharacterTwoGroup/CharacterTwoText"),
		"sprite": get_node("CharacterTwoGroup/CharacterTwo"),
		"text_sprite": get_node("CharacterTwoGroup/TextSprite"),
	},
	"shadowy": {
		"group": get_node("CharacterTwoGroup"),
		"text": get_node("CharacterTwoGroup/CharacterTwoText"),
		"sprite": get_node("CharacterTwoGroup/ShadowMan"),
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

func playText(character_type, text):
	var character = characters[character_type]["group"]
	var characterText = characters[character_type]["text"]
	var characterSprite = characters[character_type]['sprite']
	var characterTextSprite = characters[character_type]["text_sprite"]
	var blah = blah1
	character.visible = true
	characterSprite.visible = true
	characterText.text = text
	characterText.visible_characters = 0;
	characterTextSprite.visible = false
	
	var tween = create_tween()
	if (character_type == "player"):
		tween.tween_property(character, "position", Vector2(150,0), 1).as_relative()
	else:
		blah = blah2
		tween.tween_property(character, "position", Vector2(-150,0), 1).as_relative()
		
	tween.play()
	await tween.finished
	characterTextSprite.visible = true
	var textTween = create_tween()
	blah.play()
	textTween.tween_property(characterText, "visible_characters", characterText.text.length(), characterText.text.length() * .05)
	await textTween.finished
	blah.stop()
	await get_tree().create_timer(1.0).timeout
	characterText.visible_characters = 0;
	characterTextSprite.visible = false
	
func bossFight():	
	var playerCharacter = characters["player"]
	var characterOne = playerCharacter["group"]
	var characterOneText = playerCharacter["text"]
	var characterOneSprite = playerCharacter['sprite']
	var characterOneTextSprite = playerCharacter["text_sprite"]
	var chefbossCharacter = characters["chefboss"]
	var characterTwo = chefbossCharacter["group"]
	var characterTwoText = chefbossCharacter["text"]
	var characterTwoSprite = chefbossCharacter['sprite']
	var characterTwoTextSprite = chefbossCharacter["text_sprite"]
	characterOne.visible = true
	characterOneText.visible = false
	characterOneTextSprite.visible = false
	characterOneSprite.visible = true
	
	characterOne.position = Vector2(-67, -100)
	characterTwo.position = Vector2(241, -100)
	
	characterTwo.visible = true
	characterTwoText.visible = false
	characterTwoTextSprite.visible = false
	characterTwoSprite.visible = true
	
	var bossBgTween = create_tween()
	var characterOneTween = create_tween()
	var characterTwoTween = create_tween()
	var versusTweeen = create_tween()
	characterOneTween.pause()
	characterTwoTween.pause()
	versusTweeen.pause()
	bossBell.play()
	bossBgTween.tween_property(bossBg, "modulate", Color("ffffff", 1), 1.5)
	characterOneTween.tween_property(characterOne, "position", Vector2(300, 0), 0.25).as_relative()
	characterTwoTween.tween_property(characterTwo, "position", Vector2(-300, 0), 0.25).as_relative()
	versusTweeen.tween_property(versus, "position", Vector2(0, 300), 0.25).as_relative()
	
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

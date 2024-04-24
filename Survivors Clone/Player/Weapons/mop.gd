extends WeaponBase

@onready var anim = $AnimationPlayer
@onready var snd_puddle = $snd_puddle
@onready var snd_collide = $snd_collide

func _ready():
	anim.play("mop")
	ATTACK = preload("res://Player/Weapons/Attack/mop_puddle.tscn")
	NAME = "mop"
	
func _process(delta):
	if player.sprite.flip_h:
		global_position = player.global_position + Vector2(-55, 0)
		$MopSprite.flip_h = true
	else:
		global_position = player.global_position + Vector2(0, 0)
		$MopSprite.flip_h = false

func _on_timer_timeout():
	var puddle = ATTACK.instantiate()
	puddle.global_position = %PuddlePoint.global_position
	puddle.stats = stats
	puddle.snd_collide = snd_collide
	puddle.attack_size = modified_attack_size()
	snd_puddle.play()
	%PuddlePoint.add_child(puddle)
	timer.wait_time = stats["time"] * (1 - player.character.spell_cooldown)

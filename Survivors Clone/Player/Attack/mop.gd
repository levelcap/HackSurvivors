extends Node2D

const PUDDLE = preload("res://Player/Attack/mop_puddle.tscn")
var level = 1
var hp = 10
var damage = 10
var attack_size = 1.0

@onready var player = get_tree().get_first_node_in_group("player")
@onready var anim = $AnimationPlayer
@onready var snd_puddle = $snd_puddle
@onready var snd_collide = $snd_collide

func _ready():
	anim.play("mop")
	
	match level:
		1:
			damage = 10
			attack_size = 2.0 * (1 + player.spell_size)
		2:
			damage = 15
			attack_size = 3.0 * (1 + player.spell_size)
		3:
			damage = 15
			attack_size = 4.5 * (1 + player.spell_size)
		4:
			damage = 20
			attack_size = 5.0 * (1 + player.spell_size)
			
func _process(delta):
	if player.sprite.flip_h:
		global_position = player.global_position + Vector2(-55, 0)
		$MopSprite.flip_h = true
	else:
		global_position = player.global_position + Vector2(0, 0)
		$MopSprite.flip_h = false

func _on_attack_timer_timeout():
	var puddle = PUDDLE.instantiate()
	puddle.global_position = %PuddlePoint.global_position
	puddle.damage = damage
	puddle.scale = Vector2(1.0, 1.0) * attack_size
	puddle.snd_collide = snd_collide
	snd_puddle.play()
	%PuddlePoint.add_child(puddle)

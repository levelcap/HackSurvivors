extends Node2D

const KNIFE_ATTACK = preload("res://Player/Weapons/Attack/knife.tscn")

var level = 0
var hp = 1
var speed = 100
var damage = 5
var knockback_amount = 100
var attack_size = 1.0
var ammo = 0
var baseammo = 0
var time = 1.5
var attack_time = .075

var active_enemy = null
var enemies_in_range = []

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D
@onready var timer = $Timer
@onready var attack_timer = $AttackTimer

func level_up():
	level += 1
	baseammo += 1
	update_weapon()
	
func update_weapon():
	timer.wait_time = time * (1 - player.character.spell_cooldown)
	attack_timer.wait_time = attack_time
		
	timer.start()

func _process(_delta):
	if player.sprite.flip_h == true:
		scale = Vector2(1,1)
	else:
		scale = Vector2(-1,1)
		
func _on_timer_timeout():
	ammo += baseammo + player.character.additional_attacks
	attack_timer.start()
	
func get_random_target():
	var enemy_close = player.enemy_close;
	if enemy_close.size() > 0:
		return enemy_close.pick_random().global_position
	else:
		return Vector2.UP

func _on_attack_timer_timeout():
	if ammo > 0:
		var knife_attack = KNIFE_ATTACK.instantiate()
		knife_attack.level = level
		knife_attack.position = player.position
		knife_attack.target = get_random_target()
		add_child(knife_attack)
		ammo -= 1
		if ammo > 0:
			attack_timer.start()
		else:
			attack_timer.stop()

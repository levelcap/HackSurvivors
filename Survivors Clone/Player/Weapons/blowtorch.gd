extends Area2D

const FLAME = preload("res://Player/Weapons/Attack/torch_flame.tscn")

var level = 1
var speed = 50
var range = 50
var damage = 10
var knockback_amount = 100
var attack_size = 1.0
var angle = Vector2.UP

var rng = RandomNumberGenerator.new()
var random_position = rng.randi_range(0, 1)

var active_enemy = null
var enemies_in_range = []

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D
@onready var attackTimer = get_node("%AttackTimer")
@onready var snd_attack = $snd_attack

signal remove_from_array(object)

func level_up():
	level += 1
	match level:
		1:
			speed = 50
			range = 50
			damage = 10
			knockback_amount = 100
			attack_size = 1.0 * (1 + player.character.spell_size)
		2:
			speed = 20
			range = 100
			damage = 15
			knockback_amount = 100
			attack_size = 1.0 * (1 + player.character.spell_size)
		3:
			speed = 20
			range = 120
			damage = 30
			knockback_amount = 150
			attack_size = 1.5 * (1 + player.character.spell_size)
		4:
			speed = 20
			range = 120
			damage = 30
			knockback_amount = 150
			attack_size = 2.0 * (1 + player.character.spell_size)

func _physics_process(delta):
	if active_enemy && is_instance_valid(active_enemy):
		rotation = look_at_node(self, active_enemy, delta*3)
		angle = global_position.direction_to(active_enemy.global_position)
		
func enemy_in_range(enemy):
	if not active_enemy:
		active_enemy = enemy
	else:
		enemies_in_range.append(enemy)
		
func remove_enemy():
	if (enemies_in_range.size() > 0):
		active_enemy = enemies_in_range.pop_front()
	else:
		active_enemy = null

func _on_attack_timer_timeout():
	if (active_enemy):
		snd_attack.play()
		var flame = FLAME.instantiate()
		flame.global_position = %FirePoint.global_position
		flame.rotation = rotation
		flame.speed = speed
		flame.range = range
		flame.damage = damage
		flame.knockback_amount = knockback_amount
		flame.scale = Vector2(1.0, 1.0) * attack_size
		flame.angle = angle
		%FirePoint.add_child(flame)

func look_at_node(source: Node2D, target: Node2D, delta: float):
	var direction = target.global_position - source.global_position
	return lerp_angle(source.global_rotation, direction.angle(), delta)

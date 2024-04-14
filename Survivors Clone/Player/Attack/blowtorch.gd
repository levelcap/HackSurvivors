extends Area2D

const FLAME = preload("res://Player/Attack/torch_flame.tscn")

var level = 1
var speed = 50
var range = 50
var damage = 10
var knockback_amount = 100
var attack_size = 1.0

var rng = RandomNumberGenerator.new()
var random_position = rng.randi_range(0, 1)

var active_enemy = null
var enemies_in_range = []

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D
@onready var attackTimer = get_node("%AttackTimer")

signal remove_from_array(object)

func _ready():
	update_blowtorch()

func update_blowtorch():
	match level:
		1:
			speed = 50
			range = 50
			damage = 10
			knockback_amount = 100
			attack_size = 1.0 * (1 + player.spell_size)
		2:
			speed = 20
			range = 100
			damage = 15
			knockback_amount = 100
			attack_size = 1.0 * (1 + player.spell_size)
		3:
			speed = 20
			range = 120
			damage = 30
			knockback_amount = 150
			attack_size = 1.5 * (1 + player.spell_size)
		4:
			speed = 20
			range = 120
			damage = 30
			knockback_amount = 150
			attack_size = 2.0 * (1 + player.spell_size)

func _physics_process(delta):
	if active_enemy && is_instance_valid(active_enemy):
		look_at(active_enemy.global_position)
		
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
		var flame = FLAME.instantiate()
		flame.global_position = %FirePoint.global_position
		flame.rotation = rotation
		flame.speed = speed
		flame.range = range
		flame.damage = damage
		flame.knockback = knockback_amount
		flame.scale = Vector2(1.0, 1.0) * attack_size
		%FirePoint.add_child(flame)

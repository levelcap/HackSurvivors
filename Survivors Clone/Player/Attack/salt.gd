extends Area2D

var level = 1
var hp = 1
var speed = 0.1
var damage = 1000
var knockback_amount = 50
var attack_size = 1.0

@onready var player = get_tree().get_first_node_in_group("player")
signal remove_from_array(object)

func _ready():
	match level:
		1:
			hp = 1
			speed = 0.1
			damage = 1000
			knockback_amount = 50
			attack_size = 1.0 * (1 + player.spell_size)

func _physics_process(delta):
	position = player.global_position

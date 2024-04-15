extends Node2D

var level = 1
var hp = 1
var speed = 1
var damage = 5
var knockback_amount = 50
var attack_size = 1.0

@onready var player = get_tree().get_first_node_in_group("player")
@onready var snd_hit = $snd_hit

signal remove_from_array(object)

func _ready():
	match level:
		1:
			hp = 2
			speed = 1
			damage = 5
			knockback_amount = 50
			attack_size = 1.0 * (1 + player.spell_size)
		2:
			hp = 3
			speed = 1.5
			damage = 5
			knockback_amount = 50
			attack_size = 1.0 * (1 + player.spell_size)
		3:
			hp = 4
			speed = 1.5
			damage = 8
			knockback_amount = 50
			attack_size = 1.0 * (1 + player.spell_size)
		4:
			hp = 5
			speed = 2
			damage = 8
			knockback_amount = 50
			attack_size = 1.0 * (1 + player.spell_size)
			
	%WhiskAttack.hp = hp
	%WhiskAttack.damage = damage
	%WhiskAttack.knockback_amount = knockback_amount
	%WhiskAttack.snd_hit = snd_hit
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	%WhiskAttack.rotation += PI * delta * speed

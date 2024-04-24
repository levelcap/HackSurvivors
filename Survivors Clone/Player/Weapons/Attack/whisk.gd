extends Node2D

var stats = {}

@onready var player = get_tree().get_first_node_in_group("player")
@onready var snd_hit = $snd_hit

signal remove_from_array(object)

func _ready():
	%WhiskAttack.hp = stats["hp"]
	%WhiskAttack.damage = stats["damage"]
	%WhiskAttack.knockback_amount = stats["knockback_amount"]
	%WhiskAttack.snd_hit = snd_hit
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	%WhiskAttack.rotation += PI * delta * stats["speed"]

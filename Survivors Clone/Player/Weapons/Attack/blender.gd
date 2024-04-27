extends Node2D

var stats = {}

@onready var player = get_tree().get_first_node_in_group("player")
@onready var snd_hit = $snd_hit

signal remove_from_array(object)

func _ready():
	%BlenderAttack.hp = stats["hp"]
	%BlenderAttack.damage = stats["damage"]
	%BlenderAttack.knockback_amount = stats["knockback_amount"]
	%BlenderAttack.snd_hit = snd_hit
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	%BlenderAttack.rotation += PI * delta * stats["speed"]

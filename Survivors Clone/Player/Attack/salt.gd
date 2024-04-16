extends Area2D

var level = 1
var hp = 1
var speed = 0.1
var damage = 5
var knockback_amount = 50
var attack_size = 1.0

@onready var player = get_tree().get_first_node_in_group("player")
@onready var snd_hit = $snd_hit

signal remove_from_array(object)

func _ready():
	pass
	
func level_up():
	level += 1
	match level:
		1:
			damage = 5
			attack_size = 1.0 * (1 + player.spell_size)
		2:
			damage = 7
			attack_size = 1.5 * (1 + player.spell_size)
		3:
			damage = 8
			knockback_amount = 75
			attack_size = 2.0 * (1 + player.spell_size)
		4:
			damage = 9
			knockback_amount = 80
			attack_size = 2.5 * (1 + player.spell_size)
			
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.0, 1.0) * attack_size, 1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)

func enemy_hit(charge):
	snd_hit.play()
	
	

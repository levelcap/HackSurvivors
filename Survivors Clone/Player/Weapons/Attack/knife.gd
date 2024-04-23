extends Area2D

var stats = {}
var knockback_amount = 1
var damage = 1

var target = Vector2.ZERO
var angle = Vector2.ZERO

@onready var player = get_tree().get_first_node_in_group("player")
signal remove_from_array(object)

func _ready():
	angle = global_position.direction_to(target)
	rotation = angle.angle() + deg_to_rad(135)
	knockback_amount = stats["knockback_amount"]
	damage = stats["damage"]
			
	var attack_size = 1.0 * (1 + player.character.spell_size)
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1,1) * attack_size, 1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()

func _physics_process(delta):
	position += angle * stats["speed"] * delta

func enemy_hit(charge = 1):
	stats["hp"] -= charge
	if stats["hp"] <= 0:
		emit_signal("remove_from_array",self)
		queue_free()

func _on_timer_timeout():
	emit_signal("remove_from_array",self)
	queue_free()

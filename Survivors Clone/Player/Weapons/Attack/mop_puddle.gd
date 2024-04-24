extends Area2D

var stats = {}
var damage = 1
var snd_collide = null
var attack_size = 1

func _ready():
	damage = stats["damage"]
	scale = Vector2(0.1 , 0.1)
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.0 , 1.0) * attack_size, 1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	
func enemy_hit(charge):
	snd_collide.play()

func _on_timer_timeout():
	queue_free()

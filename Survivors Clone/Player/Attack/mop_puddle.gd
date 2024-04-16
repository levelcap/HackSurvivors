extends Area2D

var time = 5
var damage = 1
var snd_collide = null
var attack_size = 1

func _ready():
	var tween = create_tween()
	tween.tween_property(self, "scale", attack_size, 1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	
func enemy_hit(charge):
	snd_collide.play()

func _on_timer_timeout():
	queue_free()

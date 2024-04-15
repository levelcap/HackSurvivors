extends Area2D

var time = 5
var damage = 1
var snd_collide = null

func enemy_hit(charge):
	snd_collide.play()

func _on_timer_timeout():
	queue_free()

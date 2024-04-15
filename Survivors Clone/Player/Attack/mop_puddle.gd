extends Area2D

var time = 5
var damage = 1

func enemy_hit(charge):
	pass

func _on_timer_timeout():
	queue_free()

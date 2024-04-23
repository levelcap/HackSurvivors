extends Area2D

var travelled_distance = 0
var speed = 1
var range = 1
var damage = 1
var knockback_amount = 1
var angle = Vector2.UP

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	
	travelled_distance += speed * delta
	if travelled_distance > range:
		queue_free()
	
	
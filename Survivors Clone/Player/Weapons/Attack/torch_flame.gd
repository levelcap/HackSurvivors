extends Area2D

var travelled_distance = 0
var stats = {}
var attack_size = 1.0
var damage = 1
var knockback_amount = 1
var angle = Vector2.UP

func _ready():
	scale = Vector2(1, 1) * attack_size
	damage = stats["damage"]
	knockback_amount = stats["knockback_amount"]
	

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * stats["speed"] * delta
	
	travelled_distance += stats["speed"] * delta
	if travelled_distance > stats["range"]:
		queue_free()
	
	

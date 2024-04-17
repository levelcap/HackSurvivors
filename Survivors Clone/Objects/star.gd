extends Area2D

@export var experience = 1

var target = null
var speed = -1

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D
@onready var sound = %snd_collected

func collect():
	sound.play()
	collision.call_deferred("set","disabled",true)
	sprite.visible = false
	return experience

func _on_snd_collected_finished():
	queue_free()

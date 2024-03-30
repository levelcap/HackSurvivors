extends Area2D

@export var experience = 1

var target = null
var speed = -1

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D
@onready var sound = $snd_collected

func _ready():
	if experience < 5:
		sprite.modulate = Color(0, 1, 0)
	elif experience < 25:
		sprite.modulate = Color(0, 0, 1)
	else:
		sprite.modulate = Color(1, 0, 0)

func _physics_process(delta):
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed)
		speed += 2*delta

func collect():
	sound.play()
	collision.call_deferred("set","disabled",true)
	sprite.visible = false
	return experience


func _on_snd_collected_finished():
	queue_free()

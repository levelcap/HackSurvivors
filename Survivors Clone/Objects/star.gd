extends Area2D

@export var experience = 1

var target = null
var speed = -1

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D
@onready var cutscene = preload("res://Objects/Cutscenes/star_cutscene.tscn")

func collect():
	var star_cutscene = cutscene.instantiate()
	collision.call_deferred("set", "disabled" ,true)
	add_child(star_cutscene)
	get_tree().paused = true
	await star_cutscene.play_cutscene()
	get_tree().paused = false
	sprite.visible = false
	PlayerInfo.add_xp(1)
	return experience
	

func _on_snd_collected_finished():
	queue_free()

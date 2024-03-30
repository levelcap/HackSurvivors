extends Area2D

@export var message = ""

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D
@onready var label = $FindableItemLabel
@onready var sound = $snd_collected

var found = false;

func _ready():
	self.global_position = Vector2(randi_range(-200, 200), randi_range(-200, 200))

func _on_body_entered(body):
	if body.is_in_group("player") && !found:
		sound.play()
		label.text = message
		label.visible = true
		sprite.visible = false


func _on_body_exited(body):
	if body.is_in_group("player"):
		label.visible = false


func _on_snd_collected_finished():
	pass

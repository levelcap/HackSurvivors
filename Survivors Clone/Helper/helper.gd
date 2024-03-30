extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D
@onready var label = $MerchantLabel

func _ready():
	self.global_position = Vector2(50, 50)

func _on_body_entered(body):
	if body.is_in_group("player"):
		print()
		label.visible = true


func _on_body_exited(body):
	if body.is_in_group("player"):
		label.visible = false


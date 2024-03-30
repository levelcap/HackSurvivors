extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D
@onready var label = $MerchantLabel

var words = [
	"I've probably got all sorts of stuff",
	"What now?",
	"Quit bumping into me",
	"I am going to straight up melt about this",
]
var entered = 0;

func _ready():
	self.global_position = Vector2(50, 50)

func _on_body_entered(body):
	if body.is_in_group("player"):
		label.text = words[entered]
		label.visible = true


func _on_body_exited(body):
	if body.is_in_group("player"):
		label.visible = false
		entered += 1;
		if entered >= words.size():
			entered = 0


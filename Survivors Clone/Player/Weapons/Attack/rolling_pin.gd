extends Area2D

var stats = {}
var knockback_amount = 1
var damage = 1
var attack_size = 1.0
var angle = Vector2.RIGHT

@onready var player = get_tree().get_first_node_in_group("player")
@onready var anim = $AnimationPlayer
@onready var snd_hit = $snd_hit

signal remove_from_array(object)

func _ready():
	damage = stats["damage"]
	knockback_amount = stats["knockback_amount"]
	scale = Vector2(1.0, 1.0) * attack_size
	
	var vpr = get_viewport_rect().size * randf_range(1.1, 1.2)
	angle = [Vector2.RIGHT, Vector2.LEFT].pick_random()
	var x_spawn = player.global_position.x + vpr.x/2
	if angle == Vector2.RIGHT:
		x_spawn = player.global_position.x - vpr.x/2
	var y_spawn = player.global_position.y + randf_range(-200.0, 200.0)
	position = Vector2(x_spawn,y_spawn) 
	anim.play("rolling")

func _physics_process(delta):
	position += angle * stats["speed"] * delta

func enemy_hit(charge = 1):
	snd_hit.play()
	stats["hp"] -= charge
	if stats["hp"] <= 0:
		emit_signal("remove_from_array",self)
		queue_free()
		
	# Bounce bounce!
	if angle == Vector2.RIGHT:
		angle = Vector2.LEFT
	else:
		angle = Vector2.RIGHT

func _on_timer_timeout():
	emit_signal("remove_from_array",self)
	queue_free()

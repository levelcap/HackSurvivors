extends Area2D

var level = 1
var hp = 1
var speed = 100
var damage = 5
var knockback_amount = 100
var attack_size = 1.0
var direction = Vector2.RIGHT

@onready var player = get_tree().get_first_node_in_group("player")
@onready var anim = $AnimationPlayer
signal remove_from_array(object)

func _ready():
	var vpr = get_viewport_rect().size * randf_range(1.0, 1.1)
	direction = [Vector2.RIGHT, Vector2.LEFT].pick_random()
	var x_spawn = player.global_position.x + vpr.x/2
	if direction == Vector2.RIGHT:
		x_spawn = player.global_position.x - vpr.x/2
		
	var y_spawn = player.global_position.y + randf_range(-100.0, 100.0)
	position = Vector2(x_spawn,y_spawn) 
	anim.play("rolling")
	
	match level:
		1:
			hp = 10
			speed = 100
			damage = 5
			knockback_amount = 100
			attack_size = 1.0 * (1 + player.spell_size)
		2:
			hp = 20
			speed = 100
			damage = 5
			knockback_amount = 100
			attack_size = 1.5 * (1 + player.spell_size)
		3:
			hp = 30
			speed = 100
			damage = 10
			knockback_amount = 100
			attack_size = 1.0 * (1 + player.spell_size)
		4:
			hp = 40
			speed = 100
			damage = 19
			knockback_amount = 100
			attack_size = 2.0 * (1 + player.spell_size)
		

func _physics_process(delta):
	position += direction * speed *delta

func enemy_hit(charge = 1):
	hp -= charge
	if hp <= 0:
		emit_signal("remove_from_array",self)
		queue_free()

func _on_timer_timeout():
	emit_signal("remove_from_array",self)
	queue_free()

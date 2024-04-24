extends WeaponBase

var angle = Vector2.UP

var active_enemy = null
var enemies_in_range = []

@onready var snd_attack = $snd_attack

func _ready():
	ATTACK = preload("res://Player/Weapons/Attack/torch_flame.tscn")
	NAME = "torch"

func _process(delta):
	if active_enemy && is_instance_valid(active_enemy):
		rotation = look_at_node(self, active_enemy, delta * 3)
		angle = global_position.direction_to(active_enemy.global_position)
		
func enemy_in_range(enemy):
	if not active_enemy:
		active_enemy = enemy
	else:
		enemies_in_range.append(enemy)
		
func remove_enemy():
	if (enemies_in_range.size() > 0):
		active_enemy = enemies_in_range.pop_front()
	else:
		active_enemy = null

func _on_timer_timeout():
	if (active_enemy):
		snd_attack.play()
		var flame = ATTACK.instantiate()
		flame.global_position = %FirePoint.global_position
		flame.rotation = rotation
		flame.angle = angle
		flame.stats = stats.duplicate()
		flame.attack_size = modified_attack_size()
		%FirePoint.add_child(flame)

func look_at_node(source: Node2D, target: Node2D, delta: float):
	var direction = target.global_position - source.global_position
	return lerp_angle(source.global_rotation, direction.angle(), delta)

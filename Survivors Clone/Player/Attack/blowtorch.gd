extends Area2D

var level = 1
var hp = 9999
var duration = 2.0
var damage = 10
var knockback_amount = 100
var attack_size = 1.0

var rng = RandomNumberGenerator.new()
var random_position = rng.randi_range(0, 1)

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D
@onready var attackTimer = get_node("%AttackTimer")

signal remove_from_array(object)

func _ready():
	self.global_position = Vector2(1,1)
	update_blowtorch()

func update_blowtorch():
	level = player.attackManager.active_weapons["torch"].level
	match level:
		1:
			hp = 9999
			duration = 2.0
			damage = 10
			knockback_amount = 100
			attack_size = 1.0 * (1 + player.spell_size)
		2:
			hp = 9999
			duration = 4.0
			damage = 20
			knockback_amount = 100
			attack_size = 1.0 * (1 + player.spell_size)
		3:
			hp = 9999
			duration = 6.0
			damage = 30
			knockback_amount = 150
			attack_size = 1.0 * (1 + player.spell_size)
		4:
			hp = 9999
			duration = 10.0
			damage = 50
			knockback_amount = 200
			attack_size = 1.0 * (1 + player.spell_size)
			
	scale = Vector2(1.0, 1.0) * attack_size
	attackTimer.wait_time = duration

func _physics_process(delta):
	var position_change = Vector2(25, 0)
	sprite.flip_h = true
	if random_position == 1:
		position_change = Vector2(-25, 0)
		sprite.flip_h = false
	position = player.position + position_change
	
func enemy_hit(charge = 1):
	hp -= charge
	if hp <= 0:
		emit_signal("remove_from_array",self)
		queue_free()

func _on_attack_timer_timeout():
	emit_signal("remove_from_array",self)
	queue_free()

extends Area2D

var level = 1
var hp = 10
var speed = 100
var damage = 5
var knockback_amount = 100
var attack_size = 1.0

var target = Vector2.ZERO
var angle = Vector2.ZERO
var totalChange = 0
var state = 0

@onready var player = get_tree().get_first_node_in_group("player")
@onready var mopSprite = get_node("%MopSprite")
@onready var mopPuddleSprite = get_node("%MopPuddleSprite")
@onready var collisionSound = $snd_collide

signal remove_from_array(object)

func _ready():
	angle = global_position.direction_to(target)
	rotation = angle.angle() + deg_to_rad(135)
	match level:
		1:
			hp = 3
			speed = 100
			damage = 10
			knockback_amount = 100
			attack_size = 1.0 * (1 + player.spell_size)
		2:
			hp = 5
			speed = 100
			damage = 15
			knockback_amount = 100
			attack_size = 1.0 * (1 + player.spell_size)
		3:
			hp = 7
			speed = 100
			damage = 20
			knockback_amount = 100
			attack_size = 1.0 * (1 + player.spell_size)
		4:
			hp = 10
			speed = 100
			damage = 20
			knockback_amount = 100
			attack_size = 1.0 * (1 + player.spell_size)

	
	var tween = create_tween()
	tween.tween_property(self,"scale",Vector2(1,1)*attack_size,1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()

func _physics_process(delta):
	var change = angle*speed*delta
	totalChange += change.length()
	if totalChange < 120:
		position += angle*speed*delta
	elif state == 0:
		state = 1
		mopSprite.visible = false
		mopPuddleSprite.visible = true

func enemy_hit(charge = 1):
	hp -= charge
	if hp <= 0:
		emit_signal("remove_from_array",self)
		queue_free()

func _on_timer_timeout():
	collisionSound.play()
	emit_signal("remove_from_array",self)
	queue_free()

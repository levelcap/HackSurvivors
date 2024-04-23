extends CharacterBody2D

@export var movement_speed = 20.0
@export var hp = 10
@export var knockback_recovery = 3.5
@export var experience = 1
@export var enemy_damage = 1
@export var flip = true
@export var boss = false
@export var miniboss_texture:Resource

var knockback = Vector2.ZERO
var miniboss = false

@onready var player = get_tree().get_first_node_in_group("player")
@onready var loot_base = get_tree().get_first_node_in_group("loot")
@onready var sprite = $Sprite2D
@onready var anim = $AnimationPlayer
@onready var snd_hit = $snd_hit
@onready var hitBox = $HitBox

var death_anim = preload("res://Enemy/explosion.tscn")
var exp_gem = preload("res://Objects/experience_gem.tscn")
var star = preload("res://Objects/star.tscn")
var og_modulate = Color(1,1,1,1)

signal remove_from_array(object)
signal boss_death

func _ready():
	anim.play("walk")
	hitBox.damage = enemy_damage
	connect("boss_death", Callable(player,"boss_death"))
	og_modulate = self.modulate

func _physics_process(_delta):
	knockback = knockback.move_toward(Vector2.ZERO, knockback_recovery)
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	velocity += knockback
	move_and_slide()
	
	if direction.x > 0.1 && flip:
		sprite.flip_h = true
	elif direction.x < -0.1 && flip:
		sprite.flip_h = false

func death():
	emit_signal("remove_from_array",self)
	if boss:
		emit_signal("boss_death")
	var enemy_death = death_anim.instantiate()
	enemy_death.global_position = global_position
	get_parent().call_deferred("add_child", enemy_death)
	var new_loot = null
	if miniboss:
		new_loot = star.instantiate()
		new_loot.experience = experience * 20
	else:
		new_loot = exp_gem.instantiate()
		new_loot.experience = experience
		
	new_loot.global_position = global_position
			
	loot_base.call_deferred("add_child", new_loot)
	queue_free()
	
func make_miniboss():
	miniboss = true
	if miniboss_texture:
		sprite.texture = miniboss_texture
	hp *= 5
	enemy_damage *= 1.25
	scale = scale * 2.0

func _on_hurt_box_hurt(damage, angle, knockback_amount):
	hp -= damage
	knockback = angle * knockback_amount
	var tween = create_tween()
	tween.pause()
	
	if hp <= 0:
		death()
	else:
		tween.tween_property(self, "modulate", Color("e31616", 1), 0.1)
		tween.play()
		await tween.finished
		self.modulate = og_modulate
		snd_hit.play()

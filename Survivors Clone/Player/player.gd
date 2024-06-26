extends CharacterBody2D

class_name Player

var character = null
var last_movement = Vector2.UP
var time = 0

var experience = 0
var experience_level = 1
var collected_experience = 0

#Enemy Related
var enemy_close = []

@onready var sprite = null
@onready var walk_timer = get_node("%walkTimer")
@onready var inventory = $Inventory
@onready var character_group = $CharacterGroup

#GUI
@onready var exp_bar = get_node("%ExperienceBar")
@onready var lbl_level = get_node("%lbl_level")
@onready var level_panel = get_node("%LevelUp")
@onready var upgrade_options = get_node("%UpgradeOptions")
@onready var item_options = preload("res://Utility/item_option.tscn")
@onready var snd_level_up = get_node("%snd_levelup")
@onready var health_bar = get_node("%HealthBar")
@onready var lbl_timer = get_node("%lblTimer")

@onready var conversation_scene = preload("res://Utility/conversation.tscn")

@onready var death_panel = get_node("%DeathPanel")
@onready var lbl_result = get_node("%lbl_Result")
@onready var snd_victory = get_node("%snd_victory")
@onready var snd_lose = get_node("%snd_lose")

#Signal
signal playerdeath

func _ready():
	var char_scene = load(str("res://Player/Characters/", PlayerInfo.current_character, ".tscn"))
	character = char_scene.instantiate()
	character_group.add_child(character)
	sprite = character.sprite
	inventory.upgrade_character("whisk")
	inventory.upgrade_character("whisk")
	inventory.upgrade_character("whisk")
	inventory.upgrade_character("whisk")
	inventory.upgrade_character("scroll")
	inventory.upgrade_character("scroll")
	inventory.upgrade_character("scroll")
	inventory.upgrade_character("scroll")
	set_expbar(experience, calculate_experiencecap())
	_on_hurt_box_hurt(0,0,0)
	if not PlayerInfo.level_stats(PlayerInfo.current_level, 'won') >= 1:
		play_conversation()		

func _physics_process(delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov,y_mov)
	if mov.x > 0:
		sprite.flip_h = true
	elif mov.x < 0:
		sprite.flip_h = false

	if mov != Vector2.ZERO:
		last_movement = mov
		if walk_timer.is_stopped():
			if sprite.frame >= sprite.hframes - 1:
				sprite.frame = 0
			else:
				sprite.frame += 1
			walk_timer.start()
	
	velocity = mov.normalized() * character.movement_speed
	move_and_slide()

func _on_hurt_box_hurt(damage, _angle, _knockback):
	character.hp -= clamp(damage - character.armor, 1.0, 999.0)
	health_bar.max_value = character.maxhp
	health_bar.value = character.hp
	if character.hp <= 0:
		death()

func _on_enemy_detection_area_body_entered(body):
	if not enemy_close.has(body):
		enemy_close.append(body)

func _on_enemy_detection_area_body_exited(body):
	if enemy_close.has(body):
		enemy_close.erase(body)

func _on_grab_area_area_entered(area):
	if area.is_in_group("loot"):
		area.target = self

func _on_collect_area_area_entered(area):
	if area.is_in_group("loot"):
		var gem_exp = await area.collect()
		calculate_experience(gem_exp)

func calculate_experience(gem_exp):
	var exp_required = calculate_experiencecap()
	collected_experience += gem_exp
	if experience + collected_experience >= exp_required: #level up
		collected_experience -= exp_required-experience
		experience_level += 1
		experience = 0
		exp_required = calculate_experiencecap()
		levelup()
	else:
		experience += collected_experience
		collected_experience = 0
	
	set_expbar(experience, exp_required)

func calculate_experiencecap():
	var exp_cap = experience_level
	if experience_level < 3:
		exp_cap = experience_level*2
	elif experience_level < 20:
		exp_cap = experience_level*5
	elif experience_level < 40:
		exp_cap = 95 * (experience_level-19)*8
	else:
		exp_cap = 255 + (experience_level-39)*12
		
	return exp_cap
		
func set_expbar(set_value = 1, set_max_value = 100):
	exp_bar.value = set_value
	exp_bar.max_value = set_max_value

func levelup():
	snd_level_up.play()
	lbl_level.text = str("Level: ",experience_level)
	var tween = level_panel.create_tween()
	tween.tween_property(level_panel, "position", Vector2(220,50), 0.2).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.play()
	level_panel.visible = true
	var options = 0
	var optionsmax = 3
	while options < optionsmax:
		var option_choice = item_options.instantiate()
		var item_info = inventory.get_random_item()
		option_choice.item_name = item_info["item_name"]
		option_choice.level_idx = item_info["level_idx"]
		upgrade_options.add_child(option_choice)
		options += 1
	get_tree().paused = true
	
func upgrade_selected(upgrade):
	inventory.upgrade_character(upgrade)
	var option_children = upgrade_options.get_children()
	for i in option_children:
		i.queue_free()
	level_panel.visible = false
	level_panel.position = Vector2(800,50)
	get_tree().paused = false
	calculate_experience(0)

func change_time(argtime = 0):
	time = argtime
	var get_m = int(time/60.0)
	var get_s = time % 60
	if get_m < 10:
		get_m = str(0,get_m)
	if get_s < 10:
		get_s = str(0,get_s)
	lbl_timer.text = str(get_m,":",get_s)

func death():
	death_panel.visible = true
	emit_signal("playerdeath")
	get_tree().paused = true
	var tween = death_panel.create_tween()
	tween.tween_property(death_panel,"position",Vector2(220,50),3.0).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()
	lbl_result.text = """It happens! 
	Nerves get to everyone. 
	Keep trying!"""
	snd_lose.play()
		
func bossFight(enemy_spawn):
	var conversation = conversation_scene.instantiate()
	%OverlayLayer.add_child(conversation)
	get_tree().paused = true
	await conversation.bossFight()
	get_tree().paused = false
	%OverlayLayer.remove_child(conversation)
	add_child(enemy_spawn)
	
func play_conversation():
	var conversation = conversation_scene.instantiate()
	var textOne = """My first day! I'm pretty nervous... but what could go wrong?"""
	var textTwo = """WHO ARE YOU TALKING TO??\n\nGET TO F****NG WORK!!!"""
	%OverlayLayer.add_child(conversation)
	get_tree().paused = true
	await conversation.playText("player", textOne)
	await conversation.playText("chefboss", textTwo)	
	get_tree().paused = false
	%OverlayLayer.remove_child(conversation)
	
func boss_death():
	PlayerInfo.won_level("dayone")
	PlayerInfo.add_xp(1)
	var conversation = conversation_scene.instantiate()
	var textOne = "Whoa! A shadowy figure!"
	var textTwo = "Have you seen anything shady? Anyone talking to anyone they shouldn’t be?"
	%OverlayLayer.add_child(conversation)
	get_tree().paused = true
	await conversation.playText("player", textOne)
	await conversation.playText("shadowy", textTwo)	
	
	get_tree().paused = false
	%OverlayLayer.remove_child(conversation)
	death_panel.visible = true
	emit_signal("playerdeath")
	get_tree().paused = true
	var tween = death_panel.create_tween()
	tween.tween_property(death_panel,"position",Vector2(220,50),3.0).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()
	lbl_result.text = "Who was that? Talking to who?\n\nWell... at least your survived the day"
	snd_victory.play()

func _on_btn_menu_click_end():
	get_tree().paused = false
	var _level = get_tree().change_scene_to_file("res://TitleScreen/menu.tscn")

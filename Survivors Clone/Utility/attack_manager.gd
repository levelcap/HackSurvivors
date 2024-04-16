extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")

#Attacks
var knife = preload("res://Player/Attack/knife.tscn")
var mop = preload("res://Player/Attack/mop.tscn")
var torch = preload("res://Player/Attack/blowtorch.tscn")
var china = preload("res://Player/Attack/fine_china.tscn")
var salt = preload("res://Player/Attack/salt.tscn")
var whisk = preload("res://Player/Attack/whisk.tscn")
var rolling_pin = preload("res://Player/Attack/rolling_pin.tscn")

#Permanent weapons
var active_salt = null
var active_torch = null
var active_mop = null

var active_weapons = {}

var WEAPONS = {
	"knife": {
		"obj": knife,
		"ammo": 0,
		"baseammo": 0,
		"speed": 1.5,
		"level": 0,
		"time": 1.5,
		"attack_time": .075,
	},
	"mop": {
		"obj": mop,
		"ammo": 0,
		"baseammo": 0,
		"speed": 1.5,
		"level": 0,
		"time": 1.5,
		"attack_time": .075,
	},
	"torch": {
		"obj": torch,
		"ammo": 0,
		"baseammo": 0,
		"speed": 1.5,
		"level": 0,
		"time": 1.5,
		"attack_time": .075,
	},
	"china": {
		"obj": china,
		"ammo": 0,
		"baseammo": 0,
		"speed": 1.5,
		"level": 0,
		"time": 1.5,
		"attack_time": .075,
	},	
	"salt": {
		"obj": salt,
		"ammo": 0,
		"baseammo": 0,
		"speed": 1.5,
		"level": 0,
		"time": 1.5,
		"attack_time": .075,
	},	
	"whisk": {
		"obj": whisk,
		"ammo": 0,
		"baseammo": 0,
		"speed": 1,
		"level": 0,
		"time": 4,
		"attack_time": .5,
	},	
	"rolling_pin": {
		"obj": rolling_pin,
		"ammo": 0,
		"baseammo": 0,
		"speed": 1.5,
		"level": 0,
		"time": 1.5,
		"attack_time": .2,
	},		
}
	
func _process(delta):
	for weapon_name in active_weapons:
		active_weapons
	
func add_weapon(weapon_name):
	var weapon = WEAPONS[weapon_name]
	if weapon_name == "salt":
		var weapon_attack = weapon["obj"].instantiate()
		weapon_attack.level = weapon["level"]
		active_salt = weapon_attack
		add_child(weapon_attack)		
		active_salt.level_up()
	elif weapon_name == "torch":
		var weapon_attack = weapon["obj"].instantiate()
		weapon_attack.level = weapon["level"]
		active_torch = weapon_attack
		add_child(weapon_attack)		
		active_torch.level_up()
	elif weapon_name == "mop":
		var weapon_attack = weapon["obj"].instantiate()
		weapon_attack.level = weapon["level"]
		active_mop = weapon_attack
		add_child(weapon_attack)
		active_mop.level_up()
	else:
		var timer := Timer.new()
		var attack_timer := Timer.new()
		
		timer.wait_time = weapon["time"] * (1 - player.spell_cooldown)
		attack_timer.wait_time = weapon["attack_time"]
		weapon["timer"] = timer
		weapon["attack_timer"] = attack_timer
		active_weapons[weapon_name] = weapon
		upgrade_weapon(weapon_name)
		
		add_child(timer)
		add_child(attack_timer)
		
		timer.start()
		timer.timeout.connect(_on_timer_timeout.bind(weapon_name))
		attack_timer.timeout.connect(_on_attack_timer_timeout.bind(weapon_name))
	
func upgrade_weapon(weapon_name):
	if weapon_name == "salt":
		active_salt.level_up()
	elif weapon_name == "torch":
		active_torch.level_up()
	elif weapon_name == "mop":
		active_mop.level_up()
	else: 
		var weapon = active_weapons[weapon_name]
		weapon["level"] += 1
		weapon["baseammo"] += 1
		
	
func _on_timer_timeout(weapon_name):
	var weapon = active_weapons[weapon_name]
	weapon["ammo"] += weapon["baseammo"] + player.additional_attacks
	weapon["attack_timer"].start()
	
func _on_attack_timer_timeout(weapon_name):
	var weapon = active_weapons[weapon_name]
	if weapon["ammo"] > 0:
		var weapon_attack = weapon["obj"].instantiate()
		weapon_attack.level = weapon["level"]
				
		match weapon_name:
			"knife":
				weapon_attack.position = player.position
				weapon_attack.target = get_random_target()
			"mop":
				weapon_attack.position = player.position
				weapon_attack.target = get_random_target()
			"china":
				weapon_attack.position = player.position
				weapon_attack.last_movement = player.last_movement
		
		add_child(weapon_attack)
		weapon["ammo"] -= 1
		if weapon["ammo"] > 0:
			weapon["attack_timer"].start()
		else:
			weapon["attack_timer"].stop()

func get_random_target():
	var enemy_close = player.enemy_close;
	if enemy_close.size() > 0:
		return enemy_close.pick_random().global_position
	else:
		return Vector2.UP

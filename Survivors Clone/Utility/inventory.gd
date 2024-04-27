extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")

const WEAPON_SCENES = {
	"knife": preload("res://Player/Weapons/knife.tscn"),
	"mop": preload("res://Player/Weapons/mop.tscn"),
	"salt": preload("res://Player/Weapons/salt.tscn"),
	"torch": preload("res://Player/Weapons/blowtorch.tscn"),
	"china": preload("res://Player/Weapons/fine_china.tscn"),
	"whisk": preload("res://Player/Weapons/whisk.tscn"),
	"rolling_pin": preload("res://Player/Weapons/rolling_pin.tscn"),
	"blender": preload("res://Player/Weapons/blender.tscn"),
}

var active_weapons = {}

func add_weapon(weapon_name):
	var weapon_scene = WEAPON_SCENES[weapon_name]
	var weapon = weapon_scene.instantiate()
	active_weapons[weapon_name] = weapon
	player.character.add_child(weapon)	
	weapon.level_up()
	
func upgrade_weapon(weapon_name):
	var weapon = active_weapons[weapon_name]
	weapon.level_up()
	
func remove_weapon(weapon_name):
	var weapon = active_weapons[weapon_name]
	weapon.queue_free()
	active_weapons.erase(weapon_name)
	


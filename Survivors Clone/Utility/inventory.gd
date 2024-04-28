extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var player_weapons = player.get_node("%CollectedWeapons")
@onready var player_upgrades = player.get_node("%CollectedUpgrades")
@onready var item_container = preload("res://Player/GUI/item_container.tscn")

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
var collected_upgrades = []
var upgrade_options = []

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
	
func upgrade_character(upgrade):
	var db_item = ItemDb.ITEMS[upgrade]
	var remove_weapons = []
	
	# We replace og weapon with super weapons
	if db_item["type"] == "super":
		for req in db_item["requirements"]:
			if ItemDb.ITEMS[req]["type"] == "weapon":
				remove_weapons.append(req)
				
	match upgrade:
		"apron":
			player.character.armor += 1
		"speed":
			player.character.movement_speed += 20.0
		"tome":
			player.character.spell_size += 0.10
		"scroll":
			player.character.spell_cooldown += 0.05
		"caution":
			player.character.knockback += 0.1			
		"ring":
			player.character.additional_attacks += 1
		"food":
			player.character.hp += 20
			player.character.hp = clamp(player.character.hp, 0, player.character.maxhp)
		_:
			for remove in remove_weapons:
				remove_weapon(remove)
					
			if upgrade in collected_upgrades:
				upgrade_weapon(upgrade)
			else:
				add_weapon(upgrade)
				
	adjust_gui_collection(upgrade)
	upgrade_options.clear()
	collected_upgrades.append(upgrade)
	
func get_random_item():
	var eligible_list = []
	for item_name in ItemDb.ITEMS:
		var db_item = ItemDb.ITEMS[item_name]
		var meets_reqs = true
		if db_item["type"] == "super": # Check reqs for super weapons
			for req in db_item["requirements"]:
				if not (collected_upgrades.count(req) >= ItemDb.ITEMS[req]["levels"].size()):
					meets_reqs = false
				
		if collected_upgrades.count(item_name) >= db_item["levels"].size(): #Pass on max level items
			pass
		elif item_name in upgrade_options: #If the upgrade is already an option
			pass
		elif db_item["type"] == "item": #Don't pick food
			pass
		elif not meets_reqs:
			pass
		else:
			eligible_list.append(item_name)
			
	if eligible_list.size() > 0:
		var random_item = eligible_list.pick_random()
		upgrade_options.append(random_item)
		var item_info = { "item_name": random_item, "level_idx": collected_upgrades.count(random_item) }
		return item_info
	else:
		return  { "item_name": null, "level_idx": null }	
	
func adjust_gui_collection(upgrade):
	var db_item = ItemDb.ITEMS[upgrade]
	var get_upgraded_displayname = db_item["displayname"]
	var get_type = db_item["type"]
	if get_type != "item":
		var get_collected_displaynames = []
		for i in collected_upgrades:
			get_collected_displaynames.append(ItemDb.ITEMS[i]["displayname"])
		if not get_upgraded_displayname in get_collected_displaynames:
			var new_item = item_container.instantiate()
			new_item.item_name = upgrade
			match get_type:
				"weapon", "super":
					player_weapons.add_child(new_item)
				"upgrade":
					player_upgrades.add_child(new_item)	
	


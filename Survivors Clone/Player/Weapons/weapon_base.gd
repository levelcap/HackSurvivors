extends Node2D

class_name WeaponBase

var ATTACK = null
var NAME = null
var TIMER = null
var ATTACK_TIMER = null

@onready var player = get_tree().get_first_node_in_group("player")
@onready var timer = $Timer
@onready var attack_timer = $AttackTimer
@onready var sprite = $Sprite2D

var stats = {
	"level": 0,
	"hp": 1,
	"speed": 100,
	"damage": 5,
	"knockback_amount": 100,
	"attack_size": 1.0,
	"range": 100,
	"ammo": 0,
	"baseammo": 0,
	"time": 1.5,
	"attack_time": .075	
}

func _process(_delta):
	if player.sprite.flip_h == true:
		scale = Vector2(1,1)
	else:
		scale = Vector2(-1,1)
		
func level_up():
	stats["level"] += 1
	var level_idx = stats["level"] - 1 
	var new_level = ItemDb.ITEMS[NAME]["levels"][level_idx]
	
	if (new_level.has("upgrade")):
		var upgrade_info = new_level["upgrade"]
		for upgrade_key in upgrade_info.keys():
			var amount = upgrade_info[upgrade_key]
			stats[upgrade_key] = amount
	update_weapon()
	
func update_weapon():
	if timer:
		timer.wait_time = stats["time"] * (1 - player.character.spell_cooldown)
		timer.start()
	if attack_timer:
		print("Here")
		attack_timer.wait_time = stats["attack_time"]

func modified_attack_size():
	return stats["attack_size"] * (1 + player.character.spell_size)

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
	stats["baseammo"] += 1
	var level_idx = stats["level"] - 1 
	if (ItemDb.ITEMS[NAME]["levels"][level_idx].has("upgrade")):
		for upgrade_key in ItemDb.ITEMS[NAME]["levels"][level_idx]["upgrade"].keys():
			var stat_multiplier = 1 + ItemDb.ITEMS[NAME]["levels"][level_idx]["upgrade"][upgrade_key]
			stats[upgrade_key] *= stat_multiplier
			
	update_weapon()
	
func update_weapon():
	timer.wait_time = stats["time"] * (1 - player.character.spell_cooldown)
	attack_timer.wait_time = stats["attack_time"]
		
	timer.start()

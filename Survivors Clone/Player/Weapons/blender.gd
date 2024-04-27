extends WeaponBase

func _ready():
	ATTACK = preload("res://Player/Weapons/Attack/blender.tscn")
	NAME = "blender"

func _on_timer_timeout():
	stats["ammo"] += stats["baseammo"] + player.character.additional_attacks
	attack_timer.start()
	
func _on_attack_timer_timeout():
	if stats["ammo"] > 0:
		var attack = ATTACK.instantiate()
		attack.stats = stats.duplicate()
		add_child(attack)
		stats["ammo"] -= 1
		if stats["ammo"] > 0:
			attack_timer.start()
		else:
			attack_timer.stop()

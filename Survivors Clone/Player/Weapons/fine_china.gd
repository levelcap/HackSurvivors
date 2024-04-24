extends WeaponBase

func _ready():
	NAME = "china"
	ATTACK = preload("res://Player/Weapons/Attack/fine_china.tscn")
	
func _on_timer_timeout():
	stats["ammo"] += stats["baseammo"] + player.character.additional_attacks
	attack_timer.start()
	
func _on_attack_timer_timeout():
	if stats["ammo"] > 0:
		var attack = ATTACK.instantiate()
		attack.stats = stats.duplicate()
		attack.attack_size = modified_attack_size()
		attack.position = player.position
		attack.last_movement = player.last_movement
		add_child(attack)
		stats["ammo"] -= 1
		if stats["ammo"] > 0:
			attack_timer.start()
		else:
			attack_timer.stop()

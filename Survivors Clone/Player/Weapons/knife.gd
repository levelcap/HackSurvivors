extends WeaponBase

func _ready():
	ATTACK = preload("res://Player/Weapons/Attack/knife.tscn")
	NAME = "knife"

func _on_timer_timeout():
	stats["ammo"] += stats["baseammo"] + player.character.additional_attacks
	attack_timer.start()
	
func _on_attack_timer_timeout():
	if stats["ammo"] > 0:
		var knife_attack = ATTACK.instantiate()
		knife_attack.stats = stats
		knife_attack.position = player.position
		knife_attack.target = get_random_target()
		add_child(knife_attack)
		stats["ammo"] -= 1
		if stats["ammo"] > 0:
			attack_timer.start()
		else:
			attack_timer.stop()

func get_random_target():
	var enemy_close = player.enemy_close;
	if enemy_close.size() > 0:
		return enemy_close.pick_random().global_position
	else:
		return Vector2.UP

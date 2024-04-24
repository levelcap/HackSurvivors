extends WeaponBase

func _ready():
	ATTACK = preload("res://Player/Weapons/Attack/rolling_pin.tscn")
	NAME = "rolling_pin"
	
func _process(_delta):
	if player.sprite.flip_h == true:
		scale = Vector2(1,1)
	else:
		scale = Vector2(-1,1)
		
func _on_timer_timeout():
	stats["ammo"] += stats["baseammo"] + player.character.additional_attacks
	attack_timer.start()
	
func _on_attack_timer_timeout():
	if stats["ammo"] > 0:
		var pin = ATTACK.instantiate()
		pin.stats = stats.duplicate()
		pin.attack_size = modified_attack_size()
		add_child(pin)
		stats["ammo"] -= 1
		if stats["ammo"] > 0:
			attack_timer.start()
		else:
			attack_timer.stop()

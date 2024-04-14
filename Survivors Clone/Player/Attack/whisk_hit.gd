extends Area2D

var damage = 1
var knockback_amount = 1
var hp = 1

func enemy_hit(charge = 1):
	var whiskParent = $"../.."
	hp -= charge
	if hp <= 0:
		emit_signal("remove_from_array", whiskParent)
		whiskParent.queue_free()

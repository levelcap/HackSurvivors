extends Area2D

var damage = 1
var knockback_amount = 1
var hp = 1
var snd_hit = null
var angle = Vector2.UP

func _physics_process(delta):
	angle = Vector2.from_angle(rotation)
	
func enemy_hit(charge = 1):
	if snd_hit:
		snd_hit.play()
		
	var whiskParent = $"../.."
	hp -= charge
	if hp <= 0:
		emit_signal("remove_from_array", whiskParent)
		whiskParent.queue_free()

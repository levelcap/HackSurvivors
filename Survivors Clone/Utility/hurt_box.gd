extends Area2D

@export_enum("Cooldown","HitOnce","DisableHitBox") var HurtBoxType = 0

@onready var collision = $CollisionShape2D
@onready var disableTimer = $DisableTimer

signal hurt(damage, angle, knockback)

var hit_once_array = []
var aura_array = []

func _on_area_entered(area):
	if area.is_in_group("aura"):
		if not area.get("damage") == null:
			aura_array.append(area)
			var damage = area.damage
			var angle = Vector2.from_angle(get_parent().velocity.angle()) * -1
			var knockback = 1
			if not area.get("angle") == null:
				angle = area.angle
			if not area.get("knockback_amount") == null:
				knockback = area.knockback_amount
			var aura_timer := Timer.new()
			aura_timer.wait_time = area.get("speed")
			add_child(aura_timer)
			aura_timer.start()
			aura_timer.timeout.connect(_on_aura_timer_timeout.bind(aura_timer, area, damage, angle, knockback))
				
	if area.is_in_group("attack"):
		if not area.get("damage") == null:
			match HurtBoxType:
				0: #Cooldown
					collision.call_deferred("set","disabled",true)
					disableTimer.start()
				1: #HitOnce
					if hit_once_array.has(area) == false:
						hit_once_array.append(area)
						if area.has_signal("remove_from_array"):
							if not area.is_connected("remove_from_array",Callable(self,"remove_from_list")):
								area.connect("remove_from_array",Callable(self,"remove_from_list"))
					else:
						return
				2: #DisableHitBox
					if area.has_method("tempdisable"):
						area.tempdisable()
			var damage = area.damage
			var angle = Vector2.ZERO
			var knockback = 1
			if not area.get("angle") == null:
				angle = area.angle
			if not area.get("knockback_amount") == null:
				knockback = area.knockback_amount
			
			emit_signal("hurt",damage, angle, knockback)
			if area.has_method("enemy_hit"):
				area.enemy_hit(1)

func _on_area_exited(area):
	if aura_array.has(area):
		aura_array.erase(area)	

func remove_from_list(object):
	if hit_once_array.has(object):
		hit_once_array.erase(object)

func _on_disable_timer_timeout():
	collision.call_deferred("set","disabled",false)
	
func _on_aura_timer_timeout(timer, area, damage, angle, knockback):
	if aura_array.has(area):
		emit_signal("hurt", damage, angle, knockback)
	else:
		timer.stop()
		remove_child(timer)

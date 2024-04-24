extends WeaponBase

var damage = 1
var knockback_amount = 35
var time = 0.5

@onready var snd_hit = $snd_hit
@onready var anim = $AnimationPlayer

signal remove_from_array(object)

func _ready():
	NAME = "salt"
	anim.play("shake")
	
func update_weapon():
	damage = stats["damage"]
	knockback_amount = stats["knockback_amount"]
	time = stats['time']
			
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.0, 1.0) * modified_attack_size(), 1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)

func enemy_hit(charge):
	snd_hit.play()
	
	

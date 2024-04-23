extends CanvasGroup

class_name Character

@onready var sprite = %CharacterSprite

@export var movement_speed = 45.0
@export var maxhp = 80
@export var armor = 0
@export var speed = 0
@export var spell_cooldown = .05
@export var spell_size = 0
@export var additional_attacks = 0
@export var knockback = 0

var hp = 100

func _ready():
	hp = maxhp

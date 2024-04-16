extends Node2D

@export var helpers: Array[Helper_info] = []

@onready var player = get_tree().get_first_node_in_group("player")

@export var time = 0

signal changetime(time)

func _ready():
	connect("changetime",Callable(player,"change_time"))

func _on_timer_timeout():
	time += 1
	var helper_spawns = helpers
	for helper in helper_spawns:
		if time == helper.time_start:
			var new_helper = helper.helper
			var helper_spawn = new_helper.instantiate()
			add_child(helper_spawn)
	emit_signal("changetime",time)			

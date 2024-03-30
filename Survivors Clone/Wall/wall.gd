extends StaticBody2D

var wall = preload("res://Wall/wall.tscn")
var fridge = preload("res://Wall/fridge.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for n in 500:
		var rng = RandomNumberGenerator.new()
		var rand = rng.randi_range(0, 1)
		
		if rand > 0:
			var newWall = wall.instantiate()
			newWall.global_position = get_random_position()
			add_child(newWall)
		else:
			var newWall = fridge.instantiate()
			newWall.global_position = get_random_position()
			add_child(newWall)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func get_random_position():
	var rng = RandomNumberGenerator.new()
	var rndX = rng.randi_range(0, 4000)
	var rndY = rng.randi_range(0, 4000)
	return Vector2(rndX, rndY)

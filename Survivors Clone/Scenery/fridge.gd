extends StaticBody2D

var stove = preload("res://Scenery/stove.tscn")
var fridge = preload("res://Scenery/fridge.tscn")
var sceneryVectors = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in 1000:
		var rng = RandomNumberGenerator.new()
		var rand = rng.randi_range(0, 1)
		var scenery_position = get_random_position()
		var place = true
		
		for v in sceneryVectors:
			if scenery_position.distance_to(v) < 75.0:
				print("Scenery tooooo close")
				place = false
				break
	
		if place:
			sceneryVectors.append(scenery_position)
			if rand > 0:
				var newScenery = stove.instantiate()
				newScenery.global_position = scenery_position
				add_child(newScenery)
			else:
				var newScenery = fridge.instantiate()
				newScenery.global_position = scenery_position
				add_child(newScenery)				


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func get_random_position():
	var rng = RandomNumberGenerator.new()
	var rndX = rng.randi_range(0, 8000)
	var rndY = rng.randi_range(0, 8000)
	return Vector2(rndX, rndY)

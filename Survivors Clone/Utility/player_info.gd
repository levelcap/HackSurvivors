extends Node

const INFO_TEMPLATE = {
	"character": "Chef",
	"xp": 0,
	"levels": {
		"dayone": {
			"played": 0,
			"won": 0,
		},
		"daytwo": {
			"played": 0,
			"won": 0
		}
	}
}

var player_info = {}

var current_character = "line_cook"
var current_level = "dayone"

const FILE_NAME = "user://player_info.dat"

func _ready():
	self.load()

func save():
	var file = FileAccess.open(FILE_NAME, FileAccess.WRITE)
	file.store_string(JSON.stringify(player_info))
	file.close()

func load():
	var file = FileAccess.open(FILE_NAME, FileAccess.READ)
	if file:
		player_info = JSON.parse_string(file.get_as_text())
		file.close()
		if not player_info.get("levels"):
			print("Resetting")
			self.reset()
	else:
		self.reset()
		
func reset():
	player_info = INFO_TEMPLATE
	self.save()
		
func add_xp(xp):
	player_info["xp"] += xp
	
func played_level(level_name): 
	player_info["levels"][level_name]["played"] += 1
	self.save()

func won_level(level_name): 
	player_info["levels"][level_name]["won"] += 1	
	self.save()

func level_stats(level_name, stat):
	if player_info.get("levels").get(level_name):
		return player_info["levels"][level_name][stat]
	else:
		return 0
	

extends Control

@onready var level = preload("res://LevelSelect/levelselect.tscn")

func _on_btn_play_click_end():
	var _level = get_tree().change_scene_to_packed(level)

func _on_btn_exit_click_end():
	get_tree().quit()

func _on_ready():
	print("Hello again")
	$btn_play.grab_focus()
	var test_label = %Test
	test_label.text = str(PlayerInfo.character, " has ", PlayerInfo.gold, " gold!")

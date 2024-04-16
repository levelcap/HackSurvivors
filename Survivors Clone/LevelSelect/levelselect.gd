extends Control

var dayone = "res://World/world.tscn"
var daytwo = "res://World/daytwo.tscn"
var menu = "res://TitleScreen/menu.tscn"

func _on_levelone_btn_pressed():
	get_tree().change_scene_to_file(dayone)


func _on_leveltwo_btn_pressed():
	get_tree().change_scene_to_file(daytwo)

func _on_ready():
	$levelone_group/levelone_btn.grab_focus()


func _on_btn_back_click_end():
	var _menu = get_tree().change_scene_to_file(menu)

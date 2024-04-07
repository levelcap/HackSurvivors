extends Control

var dayone = "res://World/world.tscn"
var daytwo = "res://World/daytwo.tscn"

func _on_levelone_btn_pressed():
	get_tree().change_scene_to_file(dayone)


func _on_leveltwo_btn_pressed():
	get_tree().change_scene_to_file(daytwo)

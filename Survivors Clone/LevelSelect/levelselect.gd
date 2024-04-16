extends Control

@onready var dayone = preload("res://World/world.tscn")
@onready var daytwo = preload("res://World/daytwo.tscn")
@onready var menu = preload("res://TitleScreen/menu.tscn")

func _on_levelone_btn_pressed():
	get_tree().change_scene_to_packed(dayone)

func _on_leveltwo_btn_pressed():
	get_tree().change_scene_to_packed(daytwo)

func _on_ready():
	$levelone_group/levelone_btn.grab_focus()

func _on_btn_back_click_end():
	var _menu = get_tree().change_scene_to_packed(menu)

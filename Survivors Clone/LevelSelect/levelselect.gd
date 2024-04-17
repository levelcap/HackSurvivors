extends Control

var dayone = "res://World/dayone.tscn"
var daytwo = "res://World/daytwo.tscn"
var menu = "res://TitleScreen/menu.tscn"
var levels = PlayerInfo.player_info["levels"]

func _on_levelone_btn_pressed():
	PlayerInfo.played_level("dayone")
	get_tree().change_scene_to_file(dayone)

func _on_leveltwo_btn_pressed():
	PlayerInfo.played_level("daytwo")
	get_tree().change_scene_to_file(daytwo)

func _on_ready():
	$levelone_group/levelone_btn.grab_focus()
	if levels.get("dayone"):
		$levelone_group/played.text = str("Tries: ", levels["dayone"]["played"])
		$levelone_group/won.text = str("Wins: ", levels["dayone"]["won"])
	if levels.get("daytwo"):
		$leveltwo_group/played.text = str("Tries: ", levels["daytwo"]["played"])
		$leveltwo_group/won.text = str("Wins: ", levels["daytwo"]["won"])

func _on_btn_back_click_end():
	var _menu = get_tree().change_scene_to_file(menu)

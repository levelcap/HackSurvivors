extends Node2D

@onready var sound = $snd_play

func play_cutscene():
	sound.play()
	await get_tree().create_timer(1.0).timeout
	var tween = create_tween()
	tween.pause()
	tween.tween_property(%Star, "position", Vector2(0, 75), 1).as_relative()
	tween.parallel().tween_property(%Star, "modulate", Color(1,1,1,1), 0.5)
	tween.chain().tween_property(%StarText, "modulate", Color(1,1,1,1), 0.25)
	tween.play()
	await tween.finished
	await get_tree().create_timer(2.0).timeout
	queue_free()

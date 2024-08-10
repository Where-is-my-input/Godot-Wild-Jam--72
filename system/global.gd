extends Node

func _input(event):
	if event.is_action_pressed("reset"):
		get_tree().change_scene_to_file("res://system/debug.tscn")

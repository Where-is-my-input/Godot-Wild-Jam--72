extends Node
#const STAGE_0 = preload("res://stages/stage_0.tscn")
#const STAGE_1 = preload("res://stages/stage_1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	print("loading - ", Global.currentStage)
	await get_tree().create_timer(0.2).timeout
	match Global.currentStage:
		0:
			get_tree().change_scene_to_file("res://stages/stage_2.tscn")
		1:
			get_tree().change_scene_to_file("res://stages/stage_3.tscn")
		2:
			get_tree().change_scene_to_file("res://stages/stage_4.tscn")
		3:
			get_tree().change_scene_to_file("res://stages/stage_5.tscn")
		4:
			get_tree().change_scene_to_file("res://stages/stage_6.tscn")
		5:
			get_tree().change_scene_to_file("res://stages/stage_7.tscn")
		6:
			get_tree().change_scene_to_file("res://stages/stage_8.tscn")
		7:
			get_tree().change_scene_to_file("res://stages/stage_9.tscn")
		8:
			get_tree().change_scene_to_file("res://stages/stage_10.tscn")
		9:
			get_tree().change_scene_to_file("res://stages/stage_11.tscn")
		10:
			get_tree().change_scene_to_file("res://stages/stage_12.tscn")
		_:
			get_tree().change_scene_to_file("res://UI/game_over.tscn")

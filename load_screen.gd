extends Node
#const STAGE_0 = preload("res://stages/stage_0.tscn")
#const STAGE_1 = preload("res://stages/stage_1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	print("loading - ", Global.currentStage)
	await get_tree().create_timer(0.2).timeout
	match Global.currentStage:
		0:
			get_tree().change_scene_to_file("res://stages/stage_1.tscn")
		1:
			get_tree().change_scene_to_file("res://stages/stage_1.tscn")
		_:
			get_tree().change_scene_to_file("res://system/debu_2d.tscn")

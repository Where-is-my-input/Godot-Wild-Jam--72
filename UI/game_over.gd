extends Control
@onready var lbl_igt: Label = $CenterContainer/HBoxContainer/VBoxContainer2/lblIGT
@onready var lbl_deaths: Label = $CenterContainer/HBoxContainer/VBoxContainer2/lblDeaths

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.setBGM(true)
	lbl_deaths.text = str(Global.deaths)
	Global.gameCleared = true
	
	var time = "%02d:" % Global.hours
	time += "%02d:" % Global.minutes
	time += "%02d." % Global.seconds
	time += "%03d" % Global.msec
	lbl_igt.text = str(time)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://UI/main_menu.tscn")

extends Control
@onready var credits: Control = $credits
@onready var button: Button = $Container/BoxContainer/Button

func _ready() -> void:
	credits.visible = false
	button.grab_focus()

func _on_button_pressed() -> void:
	Global.currentStage = 0
	Global.deaths = 0
	Global.setBGM()
	get_tree().change_scene_to_file("res://system/load_screen.tscn")


func _on_button_3_pressed() -> void:
	credits.visible = true

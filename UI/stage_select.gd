extends Control
@onready var h_slider: HSlider = $CenterContainer/VBoxContainer/HBoxContainer/HSlider

@onready var label: Label = $CenterContainer/VBoxContainer/HBoxContainer/Label

func _on_button_pressed() -> void:
	Global.currentStage = h_slider.value
	get_tree().change_scene_to_file("res://system/load_screen.tscn")


func _on_h_slider_value_changed(value: float) -> void:
	label.text = str(value)

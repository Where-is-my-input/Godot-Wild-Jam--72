extends Control
@onready var button = $Container/BoxContainer/Button

func _ready():
	button.grab_focus()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://system/debu_2d.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://stages/stage_1.tscn")


func _on_button_4_pressed():
	get_tree().change_scene_to_file("res://stages/stage_2.tscn")


func _on_color_picker_button_color_changed(color):
	Global.color0 = color


func _on_color_picker_button_2_color_changed(color):
	Global.color1 = color


func _on_button_5_pressed():
	get_tree().change_scene_to_file("res://stages/stage_3.tscn")


func _on_button_6_pressed():
	get_tree().change_scene_to_file("res://system/load_screen.tscn")

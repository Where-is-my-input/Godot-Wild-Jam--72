extends Control
@onready var credits: Control = $credits
@onready var button: Button = $Container/BoxContainer/Button
@onready var color_0: ColorPickerButton = $Container/BoxContainer/color0
@onready var color_1: ColorPickerButton = $Container/BoxContainer/color1
@onready var button_4: Button = $Container/BoxContainer/Button4
#@onready var color_background: ColorRect = $colorBackground
@onready var color_background_2: ColorRect = $HBoxContainer/colorBackground2
@onready var color_background: ColorRect = $HBoxContainer/colorBackground
@onready var timer: Timer = $Timer

func _ready() -> void:
	credits.visible = false
	button.grab_focus()
	color_0.color = Global.color0
	color_1.color = Global.color1
	button_4.visible = Global.gameCleared
	color_0.visible = Global.gameCleared
	color_1.visible = Global.gameCleared

func _on_button_pressed() -> void:
	Global.newGame()
	Global.setBGM()
	get_tree().change_scene_to_file("res://system/load_screen.tscn")


func _on_button_3_pressed() -> void:
	credits.visible = true


func _on_color_0_color_changed(color: Color) -> void:
	Global.color0 = color

func _on_color_1_color_changed(color: Color) -> void:
	Global.color1 = color

func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/stage_select.tscn")

func _input(event: InputEvent) -> void:
	print(event)
	if color_background == null || color_background_2 == null || !timer.is_stopped(): return
	color_background.color = Global.color0 if color_background.color == Global.color1 else Global.color1
	color_background_2.color = Global.color0 if color_background_2.color == Global.color1 else Global.color1
	timer.start(0.5)

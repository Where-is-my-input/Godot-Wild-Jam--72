extends Node

enum WORLD { PLATFORMER, TOPDOWN, NONE }
enum WORLD_COLOR {WHITE, BLACK}

var color0 = Color.WHITE
var color1 = Color.BLACK

var currentStage = 0

#var currentColor = color0

signal platformTrigger
signal topDownTrigger

signal restart
signal colorSwap
signal platformColorSwap
signal topdownColorSwap

signal platformFinished
signal topdownFinished

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)

func _input(event):
	if event.is_action_pressed("reset"):
		get_tree().change_scene_to_file("res://system/debug.tscn")

func colorSwapped():
	colorSwap.emit()

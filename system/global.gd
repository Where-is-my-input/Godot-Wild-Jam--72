extends Node

enum WORLD { PLATFORMER, TOPDOWN, NONE }
enum WORLD_COLOR {WHITE, BLACK}

var color0 = Color.WHITE
var color1 = Color.BLACK

var currentStage = 0
var deaths = 0

#var currentColor = color0

signal platformTrigger
signal topDownTrigger

signal restart
signal colorSwap
signal platformColorSwap
signal topdownColorSwap

signal platformFinished
signal topdownFinished

const AUDIO_MAIN_MENU = preload("res://system/audio/audioMainMenu.tscn")
const AUDIO_IN_GAME = preload("res://system/audio/audio_in_game.tscn")
#var bgm

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)
	#bgm = AUDIO_MAIN_MENU.instantiate()
	add_child(AUDIO_MAIN_MENU.instantiate())
	#setBGM()

func _input(event):
	if event.is_action_pressed("reset"):
		get_tree().change_scene_to_file("res://system/debug.tscn")

func colorSwapped():
	colorSwap.emit()

func setBGM(v = false):
	for c in get_children():
		c.queue_free()
	#bgm = AUDIO_MAIN_MENU.instantiate() if v else AUDIO_IN_GAME.instantiate()
	add_child(AUDIO_MAIN_MENU.instantiate() if v else AUDIO_IN_GAME.instantiate())

extends Node

enum WORLD { PLATFORMER, TOPDOWN, NONE }
enum WORLD_COLOR {WHITE, BLACK}

var color0 = Color.WHITE
var color1 = Color.BLACK

var currentStage:int = 0
var deaths = 0

var gameCleared = false

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
	process_mode = ProcessMode.PROCESS_MODE_ALWAYS
	#setBGM()

func _input(event):
	#if event.is_action_pressed("reset"):
		#get_tree().change_scene_to_file("res://system/debug.tscn")
	#el
	if event.is_action_pressed("windowMode"):
		if DisplayServer.window_get_mode() == 0:
			DisplayServer.window_set_mode(3)
		else:
			DisplayServer.window_set_mode(0)

func colorSwapped():
	colorSwap.emit()

func setBGM(v = false):
	for c in get_children():
		c.queue_free()
	#bgm = AUDIO_MAIN_MENU.instantiate() if v else AUDIO_IN_GAME.instantiate()
	add_child(AUDIO_MAIN_MENU.instantiate() if v else AUDIO_IN_GAME.instantiate())


var showTimer = false
var timed = false
var time: float = 0.0
var hours: int = 0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0

func _process(delta):
	time += delta
	msec = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	hours = floor(time / 60 / 60 / 60)

func resetIGT():
	time = 0.0
	hours = 0
	minutes = 0
	seconds = 0
	msec = 0

extends Node2D

@export var world:Global.WORLD

func _ready():
	Global.connect("platformTrigger", trigger)
	Global.connect("topDownTrigger", trigger)

func trigger(value):
	queue_free()

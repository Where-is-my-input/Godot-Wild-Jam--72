extends Node2D

@export var world:Global.WORLD
@export var triggerValue = 1

func _ready():
	Global.connect("platformTrigger", trigger)
	Global.connect("topDownTrigger", trigger)

func trigger(value):
	if triggerValue == value:
		queue_free()

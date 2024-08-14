extends Node2D

@export var world:Global.WORLD
@export var triggerValue = 1
@onready var collision_shape_2d = $CharacterBody2D/CollisionShape2D

func _ready():
	match world:
		Global.WORLD.PLATFORMER:
			Global.connect("platformTrigger", trigger)
		Global.WORLD.TOPDOWN:
			Global.connect("topDownTrigger", trigger)
		_:
			Global.connect("topDownTrigger", trigger)
			Global.connect("platformTrigger", trigger)

func trigger(value):
	if triggerValue == value:
		collision_shape_2d.set_deferred("disabled", !collision_shape_2d.disabled)
		queue_free()

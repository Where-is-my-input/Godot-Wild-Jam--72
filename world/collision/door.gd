extends Node2D

@export var world:Global.WORLD
@export var triggerValue = 1
@onready var collision_shape_2d = $CharacterBody2D/CollisionShape2D

func _ready():
	Global.connect("platformTrigger", trigger)
	Global.connect("topDownTrigger", trigger)

func trigger(value):
	if triggerValue == value:
		collision_shape_2d.set_deferred("disabled", !collision_shape_2d.disabled)

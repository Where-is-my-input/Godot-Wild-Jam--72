extends Node2D

@export var world:Global.WORLD
@export var triggerValue = 1
@onready var collision_shape_2d = $CharacterBody2D/CollisionShape2D
@onready var audio_unlock: AudioStreamPlayer2D = $audioUnlock
@onready var sprite_2d: Sprite2D = $CharacterBody2D/Sprite2D

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
		sprite_2d.visible = false
		collision_shape_2d.set_deferred("disabled", !collision_shape_2d.disabled)
		audio_unlock.play()

func _on_audio_unlock_finished() -> void:
	queue_free()

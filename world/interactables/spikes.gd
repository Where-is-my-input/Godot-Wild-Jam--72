extends Node2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D

@export var world:Global.WORLD
@export var disabled:bool = false

func _ready():
	match world:
		Global.WORLD.PLATFORMER:
			Global.connect("platformColorSwap", swap)
		Global.WORLD.TOPDOWN:
			Global.connect("topdownColorSwap", swap)
		_:
			Global.connect("platformColorSwap", swap)
			Global.connect("topdownColorSwap", swap)
	collision_shape_2d.disabled = disabled

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		print("Player hit by spikes")

func swap():
	collision_shape_2d.disabled = !collision_shape_2d.disabled

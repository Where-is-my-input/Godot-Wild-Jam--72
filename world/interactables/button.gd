extends Node2D

@export var world:Global.WORLD

func _on_area_2d_body_entered(body):
	match world:
		Global.WORLD.PLATFORMER:
			Global.platformTrigger.emit(1)
		Global.WORLD.TOPDOWN:
			Global.topDownTrigger.emit(1)

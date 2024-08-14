extends Node2D
@onready var sprite_2d = $Sprite2D

@export var world:Global.WORLD = Global.WORLD.PLATFORMER

func _process(delta):
	sprite_2d.rotate(1)

func _on_area_2d_body_entered(body):
	if !body.is_in_group("player"): return
	match world:
		Global.WORLD.PLATFORMER:
			Global.platformFinished.emit(Global.WORLD.PLATFORMER)
		Global.WORLD.TOPDOWN:
			Global.topdownFinished.emit(Global.WORLD.TOPDOWN)
		_:
			Global.platformFinished.emit(Global.WORLD.PLATFORMER)
			Global.topdownFinished.emit(Global.WORLD.TOPDOWN)

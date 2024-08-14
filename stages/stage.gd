extends Node2D
@onready var camera_2d = $Camera2D

@export var player:Node2D

func _ready():
	player.camera.remote_path = camera_2d.get_path()

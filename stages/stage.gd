extends Node2D
@onready var camera_2d = $Camera2D
@onready var tile_map: TileMap = $TileMap

@export var player:Node2D

func _ready():
	#camera_2d.offset = Vector2(0, -162)
	player.camera.remote_path = camera_2d.get_path()
	#set_camera_limits(tile_map, camera_2d, tile_map.global_position)

func set_camera_limits(tilemap, playerCamera, globalPosition):
	#return
	var map_limits = tilemap.get_used_rect()
	var map_cellsize = tilemap.tile_set.tile_size
	#var cameraOffset = 100
	#map_cellsize += Vector2i(cameraOffset, cameraOffset)
	playerCamera.limit_left = map_limits.position.x * map_cellsize.x + globalPosition.x
	playerCamera.limit_right = map_limits.end.x * map_cellsize.x + globalPosition.x
	playerCamera.limit_top = map_limits.position.y * map_cellsize.y + globalPosition.y
	playerCamera.limit_bottom = map_limits.end.y * map_cellsize.y + globalPosition.y

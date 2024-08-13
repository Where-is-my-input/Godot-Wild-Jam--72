extends Node2D
@onready var collision_shape_2d = $cb2Platform/CollisionShape2D
@onready var color_cell = $cb2Platform/colorCell

@export var disabled = false
@export var color:Global.WORLD_COLOR = Global.WORLD_COLOR.WHITE
@export var world:Global.WORLD = Global.WORLD.PLATFORMER

func _ready():
	match world:
		Global.WORLD.PLATFORMER:
			Global.connect("platformColorSwap", colorSwapped)
		Global.WORLD.TOPDOWN:
			Global.connect("topdownColorSwap", colorSwapped)
		_:
			Global.connect("colorSwap", colorSwapped)
	collision_shape_2d.disabled = disabled
	color_cell.currentColor = color
	color_cell.setCurrentColor()

func colorSwapped():
	collision_shape_2d.disabled = !collision_shape_2d.disabled
	color_cell.colorSwap()

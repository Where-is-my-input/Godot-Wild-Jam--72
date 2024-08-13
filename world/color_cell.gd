extends ColorRect

@export var currentColor:Global.WORLD_COLOR = Global.WORLD_COLOR.WHITE

# Called when the node enters the scene tree for the first time.
#func _ready():
	#Global.connect("colorSwap", colorSwap)
	#colorSwap()

func colorSwap():
	match currentColor:
		Global.WORLD_COLOR.WHITE:
			currentColor = Global.WORLD_COLOR.BLACK
			setCurrentColor()
		Global.WORLD_COLOR.BLACK:
			currentColor = Global.WORLD_COLOR.WHITE
			setCurrentColor()

func setCurrentColor():
	match currentColor:
		Global.WORLD_COLOR.WHITE:
			color = Global.color1
		Global.WORLD_COLOR.BLACK:
			color = Global.color0

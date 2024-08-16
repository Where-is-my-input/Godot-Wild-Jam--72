extends BoxContainer

var topdownFinished = false
var platformerFinished = false
@onready var platformer_subviewport = $platformerContainer/platformerSubviewport
@onready var topdown_subviewport = $topdownContainer/topdownSubviewport

@export var platformer:PackedScene
@export var topdown:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("topdownFinished", finished)
	Global.connect("platformFinished", finished)
	Global.connect("restart", restart)
	loadStage()

func loadStage():
	if !platformer_subviewport.get_child_count() > 0:
		platformer_subviewport.add_child(platformer.instantiate())
	if !topdown_subviewport.get_child_count() > 0:
		topdown_subviewport.add_child(topdown.instantiate())

func finished(value):
	match value:
		Global.WORLD.PLATFORMER:
			platformerFinished = true
		Global.WORLD.TOPDOWN:
			topdownFinished = true
		_:
			platformerFinished = true
			topdownFinished = true
	if platformerFinished && topdownFinished:
		finishStage()

func restart():
	platformerFinished = false
	topdownFinished = false
	deloadStage()
	await get_tree().create_timer(0.1).timeout
	loadStage()

func deloadStage():
	for c in platformer_subviewport.get_children():
		c.queue_free()
	for c in topdown_subviewport.get_children():
		c.queue_free()

func _input(event):
	if event.is_action_pressed("restart"):
		restart()

func finishStage():
	Global.currentStage += 1
	get_tree().change_scene_to_file("res://system/load_screen.tscn")

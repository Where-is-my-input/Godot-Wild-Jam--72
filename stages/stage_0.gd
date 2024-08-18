extends BoxContainer

var topdownFinished = false
var platformerFinished = false
@onready var platformer_subviewport = $platformerContainer/platformerSubviewport
@onready var topdown_subviewport = $topdownContainer/topdownSubviewport
@onready var label: Label = $Label
@onready var loading: Node2D = $loading

@export var platformer:PackedScene
@export var topdown:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = str(Global.currentStage)
	Global.connect("topdownFinished", finished)
	Global.connect("platformFinished", finished)
	Global.connect("restart", restart)
	loadStage()

func loadStage():
	loading.visible = true
	get_tree().paused = true
	if !platformer_subviewport.get_child_count() > 0:
		var newPlatformer = platformer.instantiate()
		#newPlatformer.paused = true
		platformer_subviewport.add_child(newPlatformer)
	if !topdown_subviewport.get_child_count() > 0:
		topdown_subviewport.add_child(topdown.instantiate())
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = false
	loading.visible = false

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
	Global.deaths += 1
	platformerFinished = false
	topdownFinished = false
	await get_tree().create_timer(0.1).timeout
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

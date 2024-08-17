extends Node2D

@export var spawnTimer = 1.0
@onready var tmr_spawn = $tmrSpawn
@export var vectorSpeed:Vector2 = Vector2(10,0)
@onready var audio_fire: AudioStreamPlayer2D = $audioFire

const BULLET = preload("res://world/interactables/bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	tmr_spawn.start(spawnTimer)

func _on_tmr_spawn_timeout():
	var newBullet = BULLET.instantiate()
	newBullet.vectorSpeed = vectorSpeed
	add_child(newBullet)
	audio_fire.play()
	tmr_spawn.start(spawnTimer)

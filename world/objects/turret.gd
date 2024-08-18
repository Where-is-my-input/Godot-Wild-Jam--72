extends Node2D

@export var spawnTimer = 1.0
@export var firstShotTimer = 0.0
@onready var tmr_spawn = $tmrSpawn
@export var vectorSpeed:Vector2 = Vector2(10,0)
@onready var audio_fire: AudioStreamPlayer2D = $audioFire
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var charge: TextureProgressBar = $charge

const BULLET = preload("res://world/interactables/bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	tmr_spawn.start(spawnTimer if firstShotTimer == 0 else firstShotTimer)
	charge.max_value = spawnTimer

func _physics_process(delta: float) -> void:
	sprite_2d.rotate(1)
	charge.value = spawnTimer - tmr_spawn.time_left
	print(charge.value)

func _on_tmr_spawn_timeout():
	var newBullet = BULLET.instantiate()
	newBullet.vectorSpeed = vectorSpeed
	add_child(newBullet)
	audio_fire.play()
	tmr_spawn.start(spawnTimer)

extends Node2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var world:Global.WORLD
@export var disabled:bool = false

func _ready():
	match world:
		Global.WORLD.PLATFORMER:
			Global.connect("platformColorSwap", swap)
		Global.WORLD.TOPDOWN:
			Global.connect("topdownColorSwap", swap)
		_:
			Global.connect("platformColorSwap", swap)
			Global.connect("topdownColorSwap", swap)
	collision_shape_2d.disabled = disabled

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.die()

func swap():
	collision_shape_2d.disabled = !collision_shape_2d.disabled
	match animated_sprite_2d.animation:
		"0":
			animated_sprite_2d.animation = "1"
		_:
			animated_sprite_2d.animation = "0"

extends Area2D

@export var vectorSpeed:Vector2 = Vector2(25,0)

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	global_position += vectorSpeed

	#if move_and_slide(): queue_free()


func _on_body_entered(body) -> void:
	if body.is_in_group("player"):
		body.die()


func _on_timer_timeout() -> void:
	queue_free()

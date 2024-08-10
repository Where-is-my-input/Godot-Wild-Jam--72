extends CharacterBody2D

@export var vectorSpeed:Vector2 = Vector2(250,0)

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	velocity = vectorSpeed

	if move_and_slide(): queue_free()

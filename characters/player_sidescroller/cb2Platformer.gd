extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var tmr_jump_buffer = $tmrJumpBuffer

func _ready():
	Global.connect("platformFinished", finished)

func finished(v):
	queue_free()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	
	if Input.is_action_just_pressed("platformer_up"): tmr_jump_buffer.start(0.2)
	
	if !tmr_jump_buffer.is_stopped() and is_on_floor():
		velocity.y = JUMP_VELOCITY
		Global.platformColorSwap.emit()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("platformer_left", "platformer_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

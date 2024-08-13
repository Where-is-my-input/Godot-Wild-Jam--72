extends CharacterBody2D


const SPEED = 64.0
const JUMP_VELOCITY = -400.0
@onready var tmr_movement_cooldown = $tmrMovementCooldown

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var swap = false
var pos = global_position

func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2(Input.get_axis("topdown_left", "topdown_right"), Input.get_axis("topdown_up", "topdown_down"))
	if direction && tmr_movement_cooldown.is_stopped():
		#swap = true
		pos = global_position
		velocity = direction * SPEED * 60
		#position.x += SPEED * direction.x
		#position.y += SPEED * direction.y
		tmr_movement_cooldown.start(0.15)
	else:
		#velocity = Vector2(move_toward(velocity.x, 0, SPEED), move_toward(velocity.y, 0, SPEED))
		velocity = Vector2(0,0)
	#if move_and_slide(): swap = false
	move_and_slide()
	
	if snapped(pos, Vector2(0.1, 0.1)) != snapped(global_position, Vector2(0.1, 0.1)):
		print(pos, " - ", global_position)
		pos = global_position
		Global.topdownColorSwap.emit()
	
	#if swap: 
		#Global.topdownColorSwap.emit()
		#swap = false

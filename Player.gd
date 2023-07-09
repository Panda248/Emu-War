extends CharacterBody2D
class_name Player

const SPEED = 500.0
const JUMP_VELOCITY = -400.0

var controlling = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if(controlling):
		#if Input.is_action_just_pressed("jump") and is_on_floor():
			#velocity.y = JUMP_VELOCITY
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.

		
		var direction = Input.get_axis("move_left", "move_right")
		if direction:
			
			velocity.x = direction * SPEED
		else:
			
			velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.x:
			$AnimatedSprite2D.play("Walk")
		else:
			$AnimatedSprite2D.play("Chill")
			
		move_and_slide()
	if get_global_mouse_position().x > global_position.x:
		$AnimatedSprite2D.set_flip_h(false)
		$Gun/Sprite2D.set_flip_v(false)
		$Gun.position = $RightHand.position
	else: 
		$AnimatedSprite2D.set_flip_h(true)
		$Gun/Sprite2D.set_flip_v(true)
		$Gun.position = $LeftHand.position

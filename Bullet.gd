extends CharacterBody2D
class_name Bullet

const MOVE_SPEED = 500
const MAX_ROTATION_DEGREES = 2
const MOUSE_DEAD_ZONE_RADIUS = 100

var processing = false

func _ready():
	pass

func _physics_process(delta):
	if(processing):
		if(global_position.distance_to(get_global_mouse_position()) > MOUSE_DEAD_ZONE_RADIUS):
			var direction = global_position.direction_to(get_global_mouse_position())
			var angleTo = direction.angle()
			var maxRotation = deg_to_rad(MAX_ROTATION_DEGREES)
			angleTo = lerp_angle(global_rotation, angleTo, 1.0)
			angleTo = clamp(angleTo, global_rotation - maxRotation, global_rotation + maxRotation)
			set_global_rotation(angleTo)
		velocity = Vector2.RIGHT.rotated(rotation)*MOVE_SPEED
		
		
		if move_and_slide():
			$CrashTimeout.start()
			processing = false
 

func _process(delta):
	pass


func _on_crash_timeout_timeout():
	get_parent().changeToPlayer()
	pass # Replace with function body.

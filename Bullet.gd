extends CharacterBody2D
class_name Bullet

const MOVE_SPEED = 10


func _ready():
	pass

func _physics_process(delta):
	var mousePosition = get_viewport().get_mouse_position()
	rotate(get_angle_to(mousePosition))
	#move_and_collide()

func _process(delta):
	pass

extends Node2D
class_name Gun

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var angleTo = global_position.direction_to(get_global_mouse_position()).angle()
	angleTo = lerp_angle(global_rotation, angleTo, 1.0)
	angleTo = clamp(angleTo, global_rotation - 1, global_rotation + 1)
	set_global_rotation(angleTo)

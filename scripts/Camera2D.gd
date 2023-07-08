extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var lerp_amount = 0.1
	var speed = 0.01
	var offset = (get_global_mouse_position()-get_parent().player.global_position)*0.3
	
	var distance = get_parent().player.global_position.distance_to(global_position)
	
	if get_parent().player.global_position != global_position: global_position = global_position.move_toward(get_parent().player.global_position, distance/10)
	
	
	#global_position = get_parent().player.global_position + offset

	pass

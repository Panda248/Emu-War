extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var offset = (get_global_mouse_position()-get_parent().player.global_position)*0.3
	global_position = get_parent().player.global_position + offset

	pass

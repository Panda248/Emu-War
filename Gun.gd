extends Node2D
class_name Gun

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var angleTo = global_position.direction_to(get_global_mouse_position()).angle()
	angleTo = lerp_angle(global_rotation, angleTo, 1.0)
	angleTo = clamp(angleTo, global_rotation - 1, global_rotation + 1)
	set_global_rotation(angleTo)
	
	if ($Sprite2D.get_frame() == 5):
		get_parent().get_parent().changeToBullet()
	
	#if angleTo > -PI/2 and angleTo < PI/2:
		#get_node("Sprite2D").set_flip_v(false)

	#else: 
		#get_node("Sprite2D").set_flip_v(true)
		

var animationFinished = false

func shootAnimation():
	$Sprite2D.play()
	$Timer.start()

func _on_sprite_2d_animation_finished():
	$Sprite2D.stop()

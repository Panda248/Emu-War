extends Sprite2D

class_name Emu

const ZOOM_SPEED = 0.001
const ROTATE_SPEED = 0.5
const DEPTH_MIN = 20
const DEPTH_MAX = 100


var dead = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($Timer.time_left > 0):
		$Camera2D.rotate(deg_to_rad($Timer.time_left*-ROTATE_SPEED))
		$Camera2D.zoom*=1+($Timer.time_left * ZOOM_SPEED)
	pass


func _on_body_body_entered(body):
	print("body")
	if(body is Bullet):
		kill(body)
	pass # Replace with function body.


func _on_head_body_entered(body):
	print("head")
	if(body is Bullet):
		kill(body)
	pass # Replace with function body.


func _on_leg_body_entered(body):
	print("leg")
	if(body is Bullet):
		kill(body)

	pass # Replace with function body.


func kill(body : Bullet):
	body.hide()
	$Marker2D.global_position = body.global_position + (Vector2.RIGHT.rotated(body.rotation)*randf_range(DEPTH_MIN, DEPTH_MAX))
	$Camera2D.global_position = $Marker2D.global_position
	$GPUParticles2D.global_position = $Marker2D.global_position
	$GPUParticles2D2.global_position = $Marker2D.global_position
	$GPUParticles2D3.global_position = $Marker2D.global_position
	
	body.processing = false
	
	$GPUParticles2D.set_deferred("emitting", true)
	$GPUParticles2D2.set_deferred("emitting", true)
	$GPUParticles2D3.set_deferred("emitting", true)
	$Camera2D.make_current()
	$Timer.start()


func _on_timer_timeout():
	dead = true
	pass # Replace with function body.

extends Node2D


var player

var id

func _ready():
	player = $Player

func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		enter_level()
	#dddddddddddd$CanvasLayer/Label.global_position = find_child("Player").global_position
	pass

func _on_end_body_entered(body):
	if body is Player:
		$CanvasLayer/AnimationPlayer.play("end")
		$CanvasLayer/Camera2D.enabled = true
		$CanvasLayer/Camera2D.make_current()
		$Timer.start()
	pass # Replace with function body.


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://MainMenu.tscn")
	pass # Replace with function body.
	
func _on_level_1_body_entered(body):
	if body is Player:
		id = 1
		$Level1/Label.show()
	pass # Replace with function body.


func enter_level():
	GlobalVar.world.pack(get_owner())
	get_tree().change_scene_to_file("res://scenes/Level"+ str(id) + ".tscn")
	

func _on_level_2_body_entered(body):
	if body is Player:
		id = 2
		$Level2/Label.show()
		pass # Replace with function body.


func _on_level_3_body_entered(body):
	if body is Player:
		id = 3
		$Level3/Label.show()
	pass # Replace with function body.


func _on_level_1_body_exited(body):
	$Level1/Label.show()
	pass # Replace with function body.


func _on_level_2_body_exited(body):
	$Level2/Label.show()
	pass # Replace with function body.


func _on_level_3_body_exited(body):
	$Level3/Label.show()
	pass # Replace with function body.

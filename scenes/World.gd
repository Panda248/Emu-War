extends Node2D

func _process(delta):
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

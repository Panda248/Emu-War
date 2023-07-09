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


func _on_area_2d_area_entered(area):#level 1
	$Area2D.set_deferred("monitoring")
	pass # Replace with function body.


func _on_area_2d_3_area_entered(area):#level 2
	$Area2D3
	pass # Replace with function body.


func _on_area_2d_2_area_entered(area):#level 3
	$Area2D2
	pass # Replace with function body.

extends Node2D


var player

func _ready():
	player = $Player

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
	
func _on_level_1_body_entered(body):
	$Level1/CollisionShape2D.set_deferred("disabled", true)
	GlobalVar.world.pack(get_owner())
	print("1")
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")
	pass # Replace with function body.


func _on_level_2_body_entered(body):
	$Level2/CollisionShape2D.set_deferred("disabled", true)
	GlobalVar.world.pack(get_owner())
	print("3")
	get_tree().change_scene_to_file("res://scenes/Level3.tscn")
	pass # Replace with function body.


func _on_level_3_body_entered(body):
	$Level3/CollisionShape2D.set_deferred("disabled", true)
	GlobalVar.world.pack(get_owner())
	print("2")
	get_tree().change_scene_to_file("res://scenes/Level2.tscn")
	pass # Replace with function body.

extends Node2D

var player

func _ready():
	player = $Bullet

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		$Bullet.position.x = $Player/Gun/Point.global_position.x
		$Bullet.position.y = $Player/Gun/Point.global_position.y
		player = $Bullet
		player.visible = true

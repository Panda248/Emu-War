extends Node2D

var currentForm
# 0 = Player, 1 = Bullet

var player

func _ready():
	player = $Player
	currentForm = 0

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		if currentForm == 0:
			currentForm = 1
			$Bullet.position = $Player/Gun/Point.global_position
			player = $Bullet
			$Bullet.visible = true
		else:
			currentForm = 0
			player = $Player
			$Bullet.visible = false

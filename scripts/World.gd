extends Node2D

var currentForm
# 0 = Player, 1 = Bullet

var player

var zoom
var targetZoom
const PLAYERZOOM = 0.6
const BULLETZOOM = 1.2

func _ready():
	player = $Player
	currentForm = 0
	zoom = PLAYERZOOM
	targetZoom = zoom

func _process(delta):
	slowZoom()
	$Camera2D.zoom = Vector2(zoom, zoom)
	if Input.is_action_just_pressed("shoot"):
		if currentForm == 0:
			currentForm = 1
			$Bullet.position = $Player/Gun/Point.global_position
			player = $Bullet
			$Bullet.visible = true
			targetZoom = BULLETZOOM
		else:
			currentForm = 0
			player = $Player
			$Bullet.visible = false
			targetZoom = PLAYERZOOM

func slowZoom():
	if zoom != targetZoom:
		if targetZoom-zoom > 0:
			zoom+=0.01
		else:
			zoom-=0.01

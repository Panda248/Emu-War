extends Node2D
class_name Level

var currentForm
# 0 = Player, 1 = Bullet

var player

var zoom

var emus : Array

var targetZoom
const PLAYERZOOM = 0.6
const BULLETZOOM = 1.2

func _ready():
	player = $Player
	#$Bullet.collision_layer = 0
	currentForm = 0
	zoom = PLAYERZOOM
	targetZoom = zoom
	for child in get_children():
		if child is Emu:
			emus.append(child)

func _process(delta):
	slowZoom()
	$Camera2D.zoom = Vector2(zoom, zoom)
	if Input.is_action_just_pressed("shoot"):
		if currentForm == 0:
			$Bullet.rotation = $Player/Gun.rotation
			changeToBullet()
		else:
			changeToPlayer()
	
	

func changeToBullet():
	$Bullet.processing = true
	player.controlling = false
	currentForm = 1
	$Bullet.position = $Player/Gun/Point.global_position
	player = $Bullet
	$Bullet.visible = true
	$Bullet/CollisionShape2D.disabled = false
	#$Bullet.collision_layer = 1
	targetZoom = BULLETZOOM
	

func changeToPlayer():
	$Bullet.processing = false
	currentForm = 0
	player = $Player
	player.controlling = true
	$Bullet.visible = false
	$Bullet/CollisionShape2D.disabled = true
	#$Bullet.collision_layer = 0
	targetZoom = PLAYERZOOM

func slowZoom():
	if abs(targetZoom - zoom) > 0.1:
		if targetZoom-zoom > 0:
			zoom+=0.01
		elif targetZoom-zoom < 0:
			zoom-=0.01


func emus_dead() -> bool:
	for emu in emus:
		if !emu.dead:
			return false
	return true


func _on_area_2d_body_entered(body):
	if body is Player:
		GlobalVar.world = load("res://scenes/World.tscn")
		get_tree().change_scene_to_packed(GlobalVar.world)
	pass # Replace with function body.

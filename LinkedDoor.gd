extends Node2D

@export var buttonUnpressed : Texture
@export var buttonPressed : Texture
# Called when the node enters the scene tree for the first time.
func _ready():
	$Door/CollisionShape2D.disabled = false
	$Door.collision_layer = 2
	$Target.texture = buttonUnpressed
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_target_body_entered(body):
	if body != $Target/StaticBody:
		$Door.visible = false
		$Door/CollisionShape2D.disabled = true
		$Door.collision_layer = 0
		$Target.texture = buttonPressed

func _on_target_body_exited(body):
	if body != $Target/StaticBody:
		pass
		#$Door.visible = true
		#$Door/CollisionShape2D.disabled = false

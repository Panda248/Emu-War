extends CanvasLayer

var sceneList
var currentSceneIndex = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	sceneList = $Scenes
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_released("ui_accept")):
		proceed()
	pass

func proceed():
	pass

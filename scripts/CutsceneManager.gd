extends CanvasLayer

var sceneList
var currentSceneIndex = 0
var sceneCount = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	sceneList = $Scenes
	sceneCount = sceneList.get_children().size()-1
	for i in range(sceneCount-1):
		sceneList.get_child(i+1).hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_released("ui_accept")):
		if(sceneCount == currentSceneIndex):
			exit()
		else:
			proceed()

func proceed():
	if(sceneList.get_child(currentSceneIndex).is_finished()):
		sceneList.get_child(currentSceneIndex).hide()
		currentSceneIndex+=1
		sceneList.get_child(currentSceneIndex).start()
	else:
		sceneList.get_child(currentSceneIndex).proceed()
 
func exit():
	get_tree().quit()
	pass

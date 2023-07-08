extends Control

var index = 0
var total_actions
# Called when the node enters the scene tree for the first time.
func _ready():
	total_actions = get_child_count()-1
	print(str(total_actions))
	for i in range(get_child_count(true)-1):
		get_child(i+1).hide()
	
	pass # Replace with function body.

func start():
	show()
	print(str(index))
	if(get_node("Background").has_node("AnimationPlayer")):
		get_node("Background").get_node("AnimationPlayer").play("action")

func proceed():
	self.index+=1
	print(str(index))
	if(get_child(index)):
		get_child(index).show()
		get_child(index).get_child(0).play("action")
	pass

func is_finished() -> bool:
	return index == total_actions

extends CanvasLayer

var nextPath

func fadeTo(path):
	nextPath = path
	get_node("Anim").play("fade")
	
func changeScene():
	if nextPath != null:
		get_tree().change_scene(nextPath)
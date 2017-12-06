extends RigidBody2D

export var positionCar = [Vector2(121.888,1000), Vector2(365,1000), Vector2(599.0236,1000)]
var position = 1
onready var cena = get_tree().get_current_scene()

func _ready():
	pass

func goLeft():
	if cena.estado == cena.START:
		if position >= 1:
			get_node("CarCurve").play()
			position -= 1
			cena.playerMove(position)

func goRight():
	if cena.estado == cena.START:
		if position < 2:
			get_node("CarCurve").play()
			position += 1
			cena.playerMove(position)

func _on_btnLeft_pressed():
	goLeft()

func _input(event):
	if event.is_action_pressed("ui_left"):
		goLeft()
	if event.is_action_pressed("ui_right"):
		goRight()

func _on_btnLeft1_pressed():
	goRight()

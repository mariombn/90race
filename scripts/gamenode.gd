extends Node2D

const ACCELERATION = 0.1
const START = 1
const PAUSE = 0
const WAITING_GENERATION = 2

onready var lblGrid = get_node("Grid/lblGrid")
onready var road = get_node("Road")
onready var timerSpeedUp = get_node("SpeedUp")
onready var playerCar = get_node("PlayerCar")

var waiting_count = 0
var pontos = 0
var velocidade = 1
var grid = 3
var estado = PAUSE

func _ready():
	playerMove(1)
	randomize()

func go():
	road.play("Road")
	timerSpeedUp.start()
	estado = START
	lblGrid.set_align(lblGrid.ALIGN_RIGHT)
	lblGrid.set_text(str(0))
	lblGrid.show()
	get_node("PlayerCar/CarEngine").play()
	
func start():
	road.play("Road")
	estado = START
	
func pause():
	estado = PAUSE
	road.stop()
	
func kill():
	get_node("PlayerCar/CarCrash").play()
	pause()
	Transition.fadeTo("res://scenes/MainMenu.tscn")
	
func setPoint():
	pontos += 1
	lblGrid.set_text(str(pontos))

func acceleration():
	if estado == START:
		waiting_count += 1
		velocidade += ACCELERATION
		road.set_speed(velocidade + 1)

func _on_StartRacing_timeout():
	grid -= 1
	if grid == 0:
		lblGrid.set_text("GO!!")
		go()
	elif grid < 0:
		get_node("StartRacing").stop()
	else:
		lblGrid.set_text(str(grid))


func _on_SpeedUp_timeout():
	acceleration()

func playerMove(newPosition):
	playerCar.set_pos(playerCar.positionCar[newPosition])

func _on_PointTime_timeout():
	if estado == START:
		setPoint()

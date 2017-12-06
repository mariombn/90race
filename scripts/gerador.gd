extends Position2D

onready var rivalcar = preload("res://scenes/RivalCar.tscn")
var positionCar = [Vector2(121.888,-150), Vector2(365,-150), Vector2(599.0236,-150)]
onready var cena = get_tree().get_current_scene()

func _ready():
	randomize()

func _on_Timer_timeout():
	if cena.estado == cena.START:
		var numCars = rand_range(1, 3)
		var countCar = 1
		while countCar <= numCars:
			var newRivalCar = rivalcar.instance()
			var positionMatrix = rand_range(0, 3)
			newRivalCar.set_pos(positionCar[positionMatrix])
			get_owner().add_child(newRivalCar)
			countCar += 1
		if get_node("Timer").get_wait_time() > 1:
			get_node("Timer").set_wait_time(get_node("Timer").get_wait_time() - 0.01)
			print(get_node("Timer").get_wait_time())

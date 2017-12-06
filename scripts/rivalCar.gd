extends Node2D
onready var cena = get_tree().get_current_scene()

func _ready():
	set_process(true)

func _process(delta):
	if cena.estado == cena.START:
		set_pos(get_pos() + Vector2(0, ((cena.velocidade * 30) + 800) * delta))
	if get_pos().y > 1400:
		queue_free()

func _on_Area2D_body_enter( body ):
	if body.get_name() == "PlayerCar":
		cena.kill()

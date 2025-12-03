extends Node

# Gestionnaire d'input pour le jeu
# Centralise la gestion des entrées

signal move_up()
signal move_down()
signal move_left()
signal move_right()
signal action_pressed()
signal cancel_pressed()

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		move_up.emit()
	elif event.is_action_pressed("ui_down"):
		move_down.emit()
	elif event.is_action_pressed("ui_left"):
		move_left.emit()
	elif event.is_action_pressed("ui_right"):
		move_right.emit()
	elif event.is_action_pressed("ui_accept"):
		action_pressed.emit()
	elif event.is_action_pressed("ui_cancel"):
		cancel_pressed.emit()

func is_moving() -> bool:
	return Input.is_action_pressed("ui_up") or \
		   Input.is_action_pressed("ui_down") or \
		   Input.is_action_pressed("ui_left") or \
		   Input.is_action_pressed("ui_right")

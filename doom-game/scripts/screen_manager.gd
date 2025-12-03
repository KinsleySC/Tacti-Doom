extends Node

# Gestionnaire d'écrans avec système de pile
# Permet de naviguer entre différents écrans

var screen_stack: Array[Node] = []

func push_screen(screen: PackedScene) -> void:
	hide_current()
	var instance = create_screen(screen)
	screen_stack.push_back(instance)

func pop_screen() -> void:
	if screen_stack.is_empty():
		return
	var screen = screen_stack.pop_back()
	screen.queue_free()
	show_current()

func create_screen(scene: PackedScene) -> Node:
	var instance = scene.instantiate()
	add_child(instance)
	return instance

func show_current() -> void:
	if not screen_stack.is_empty():
		screen_stack.back().show()

func hide_current() -> void:
	if not screen_stack.is_empty():
		screen_stack.back().hide()

func clear_all() -> void:
	for screen in screen_stack:
		screen.queue_free()
	screen_stack.clear()

extends Node

# Gestionnaire principal du jeu
# Gère l'état global et la navigation entre écrans

signal screen_changed(screen_name: String)

var current_screen: Node = null

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func change_screen(new_screen: PackedScene) -> void:
	if current_screen:
		remove_screen()
	load_screen(new_screen)

func load_screen(screen: PackedScene) -> void:
	if screen:
		current_screen = screen.instantiate()
		add_child(current_screen)

func remove_screen() -> void:
	if current_screen:
		current_screen.queue_free()
		current_screen = null

func quit_game() -> void:
	get_tree().quit()

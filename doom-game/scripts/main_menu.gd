extends Control

# Menu principal avec style Doom
# Navigation: Haut/Bas/Entrée/Échap

@onready var menu_items: Array = [
	$VBoxContainer/StartButton,
	$VBoxContainer/OptionsButton,
	$VBoxContainer/QuitButton
]

var selected_index: int = 0
var normal_color: Color = Color.WHITE
var selected_color: Color = Color.RED

func _ready() -> void:
	update_selection()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_down"):
		move_down()
	elif event.is_action_pressed("ui_up"):
		move_up()
	elif event.is_action_pressed("ui_accept"):
		activate_item()
	elif event.is_action_pressed("ui_cancel"):
		quit_game()

func move_down() -> void:
	selected_index = (selected_index + 1) % menu_items.size()
	update_selection()

func move_up() -> void:
	selected_index = (selected_index - 1 + menu_items.size()) % menu_items.size()
	update_selection()

func update_selection() -> void:
	for i in range(menu_items.size()):
		if menu_items[i] is Label:
			if i == selected_index:
				menu_items[i].modulate = selected_color
			else:
				menu_items[i].modulate = normal_color

func activate_item() -> void:
	match selected_index:
		0:
			start_game()
		1:
			open_options()
		2:
			quit_game()

func start_game() -> void:
	get_tree().change_scene_to_file("res://scenes/game_screen.tscn")

func open_options() -> void:
	get_tree().change_scene_to_file("res://scenes/options_screen.tscn")

func quit_game() -> void:
	get_tree().quit()

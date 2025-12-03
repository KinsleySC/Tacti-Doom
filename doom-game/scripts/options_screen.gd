extends Control

# Écran d'options
# Permet de configurer le jeu

@onready var option_items: Array = [
	$VBoxContainer/VolumeOption,
	$VBoxContainer/FullscreenOption,
	$VBoxContainer/BackOption
]

var selected_index: int = 0
var volume: float = 0.5
var fullscreen: bool = false

func _ready() -> void:
	update_selection()
	update_display()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_down"):
		move_down()
	elif event.is_action_pressed("ui_up"):
		move_up()
	elif event.is_action_pressed("ui_left"):
		adjust_left()
	elif event.is_action_pressed("ui_right"):
		adjust_right()
	elif event.is_action_pressed("ui_accept"):
		activate_item()
	elif event.is_action_pressed("ui_cancel"):
		return_to_menu()

func move_down() -> void:
	selected_index = (selected_index + 1) % option_items.size()
	update_selection()

func move_up() -> void:
	selected_index = (selected_index - 1 + option_items.size()) % option_items.size()
	update_selection()

func adjust_left() -> void:
	if selected_index == 0:
		volume = max(0.0, volume - 0.1)
		update_display()
	elif selected_index == 1:
		toggle_fullscreen()

func adjust_right() -> void:
	if selected_index == 0:
		volume = min(1.0, volume + 0.1)
		update_display()
	elif selected_index == 1:
		toggle_fullscreen()

func toggle_fullscreen() -> void:
	fullscreen = not fullscreen
	apply_fullscreen()
	update_display()

func apply_fullscreen() -> void:
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func update_selection() -> void:
	for i in range(option_items.size()):
		if option_items[i] is Label:
			if i == selected_index:
				option_items[i].modulate = Color.RED
			else:
				option_items[i].modulate = Color.WHITE

func update_display() -> void:
	$VBoxContainer/VolumeOption.text = "Volume: %d%%" % int(volume * 100)
	$VBoxContainer/FullscreenOption.text = "Fullscreen: %s" % ("ON" if fullscreen else "OFF")

func activate_item() -> void:
	if selected_index == 2:
		return_to_menu()

func return_to_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

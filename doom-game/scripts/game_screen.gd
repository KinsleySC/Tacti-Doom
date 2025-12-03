extends Control

# Écran de jeu tactique
# Exemple de gameplay avec grille

@export var grid_size: Vector2i = Vector2i(10, 10)
@export var cell_size: int = 50

var grid: Array = []
var selected_cell: Vector2i = Vector2i(0, 0)

func _ready() -> void:
	init_grid()
	update_display()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		return_to_menu()
	elif event.is_action_pressed("ui_up"):
		move_selection(Vector2i(0, -1))
	elif event.is_action_pressed("ui_down"):
		move_selection(Vector2i(0, 1))
	elif event.is_action_pressed("ui_left"):
		move_selection(Vector2i(-1, 0))
	elif event.is_action_pressed("ui_right"):
		move_selection(Vector2i(1, 0))
	elif event.is_action_pressed("ui_accept"):
		select_cell()

func init_grid() -> void:
	grid.clear()
	for y in range(grid_size.y):
		var row = []
		for x in range(grid_size.x):
			row.append(0)
		grid.append(row)

func move_selection(direction: Vector2i) -> void:
	var new_pos = selected_cell + direction
	if is_valid_pos(new_pos):
		selected_cell = new_pos
		update_display()

func is_valid_pos(pos: Vector2i) -> bool:
	return pos.x >= 0 and pos.x < grid_size.x and pos.y >= 0 and pos.y < grid_size.y

func select_cell() -> void:
	grid[selected_cell.y][selected_cell.x] = 1
	update_display()

func update_display() -> void:
	queue_redraw()

func _draw() -> void:
	draw_grid()
	draw_selection()

func draw_grid() -> void:
	for y in range(grid_size.y):
		for x in range(grid_size.x):
			var pos = Vector2(x * cell_size, y * cell_size + 100)
			var color = Color.DARK_GRAY if grid[y][x] == 0 else Color.GREEN
			draw_rect(Rect2(pos, Vector2(cell_size - 2, cell_size - 2)), color)

func draw_selection() -> void:
	var pos = Vector2(selected_cell.x * cell_size, selected_cell.y * cell_size + 100)
	draw_rect(Rect2(pos, Vector2(cell_size - 2, cell_size - 2)), Color.YELLOW, false, 3.0)

func return_to_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

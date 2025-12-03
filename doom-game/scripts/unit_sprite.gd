extends Sprite2D

# Sprite pour une unité sur la grille
# Affichage visuel d'une unité

@export var unit_color: Color = Color.BLUE
@export var cell_size: int = 50

var grid_pos: Vector2i = Vector2i.ZERO

func _ready() -> void:
	setup_visual()

func setup_visual() -> void:
	texture = create_texture()
	modulate = unit_color

func create_texture() -> ImageTexture:
	var img = Image.create(cell_size - 10, cell_size - 10, false, Image.FORMAT_RGBA8)
	img.fill(Color.WHITE)
	return ImageTexture.create_from_image(img)

func set_grid_position(pos: Vector2i) -> void:
	grid_pos = pos
	position = Vector2(pos.x * cell_size, pos.y * cell_size)

func highlight(enabled: bool) -> void:
	if enabled:
		modulate = Color.YELLOW
	else:
		modulate = unit_color

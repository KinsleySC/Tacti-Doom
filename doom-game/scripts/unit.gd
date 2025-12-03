extends Node2D

# Classe pour une unité tactique
# Gère le déplacement et les actions

class_name Unit

@export var unit_name: String = "Unit"
@export var health: int = 100
@export var max_health: int = 100
@export var movement_range: int = 3
@export var attack_power: int = 10

var grid_position: Vector2i = Vector2i.ZERO
var is_selected: bool = false
var has_moved: bool = false

func _ready() -> void:
	pass

func set_pos(pos: Vector2i) -> void:
	grid_position = pos

func can_move() -> bool:
	return not has_moved and health > 0

func move_to(pos: Vector2i) -> bool:
	if can_move():
		grid_position = pos
		has_moved = true
		return true
	return false

func take_damage(amount: int) -> void:
	health = max(0, health - amount)

func heal(amount: int) -> void:
	health = min(max_health, health + amount)

func is_alive() -> bool:
	return health > 0

func reset_turn() -> void:
	has_moved = false

extends Node

# Gestionnaire de combat tactique
# Gère le tour par tour et les actions

class_name BattleManager

signal turn_changed(player_turn: bool)
signal unit_selected(unit: Node)
signal action_completed()

var is_player_turn: bool = true
var selected_unit: Node = null
var player_units: Array = []
var enemy_units: Array = []

func _ready() -> void:
	pass

func start_battle() -> void:
	is_player_turn = true
	emit_turn_signal()

func select_unit(unit: Node) -> void:
	if selected_unit:
		deselect_unit()
	selected_unit = unit
	unit.is_selected = true
	unit_selected.emit(unit)

func deselect_unit() -> void:
	if selected_unit:
		selected_unit.is_selected = false
		selected_unit = null

func can_act(unit: Node) -> bool:
	if is_player_turn:
		return unit in player_units
	return unit in enemy_units

func end_turn() -> void:
	reset_units()
	is_player_turn = not is_player_turn
	emit_turn_signal()

func reset_units() -> void:
	var units = player_units if is_player_turn else enemy_units
	for unit in units:
		unit.reset_turn()

func emit_turn_signal() -> void:
	turn_changed.emit(is_player_turn)

func add_player_unit(unit: Node) -> void:
	player_units.append(unit)

func add_enemy_unit(unit: Node) -> void:
	enemy_units.append(unit)

func check_victory() -> bool:
	return enemy_units.all(func(u): return not u.is_alive())

func check_defeat() -> bool:
	return player_units.all(func(u): return not u.is_alive())

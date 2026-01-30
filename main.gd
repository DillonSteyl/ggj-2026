class_name Main
extends Node

const MAIN_MENU_SCENE = preload("uid://cgppg2ly351q0")
const MAIN_GAME_SCENE = preload("uid://c8fqt4q0jg1r6")

@onready var menu: Control = $Menu
@onready var game_root: Node2D = $GameRoot


func _ready() -> void:
	go_to_menu()


func go_to_menu() -> void:
	_set_game(null)

	var main_menu: MainMenu = MAIN_MENU_SCENE.instantiate()
	_set_menu(main_menu)

	main_menu.play_button.pressed.connect(_play)


func _play() -> void:
	_clear_menu()
	_set_game(MAIN_GAME_SCENE.instantiate())


func _set_menu(ui_node: Control) -> void:
	_clear_menu()
	if ui_node:
		menu.add_child(ui_node)


func _clear_menu() -> void:
	for child in menu.get_children():
		child.queue_free()


func _set_game(game_node: Node) -> void:
	for child in game_root.get_children():
		child.queue_free()

	if game_node:
		game_root.add_child(game_node)

class_name Main
extends Node

const MAIN_MENU_SCENE = preload("uid://cgppg2ly351q0")

@onready var menu: Control = $Menu
@onready var game: Control = $Game


func _ready() -> void:
	go_to_menu()


func go_to_menu() -> void:
	set_game(null)

	var main_menu: MainMenu = MAIN_MENU_SCENE.instantiate()
	set_menu(main_menu)


func set_menu(ui_node: Control) -> void:
	for child in menu.get_children():
		child.queue_free()

	if ui_node:
		menu.add_child(ui_node)


func set_game(game_node: Node3D) -> void:
	for child in game.get_children():
		child.queue_free()

	if game_node:
		game.add_child(game_node)

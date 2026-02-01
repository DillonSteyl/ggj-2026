class_name CheatSheet
extends Control

@onready var close_button := $%CloseButton


func _ready() -> void:
	close_button.pressed.connect(hide)

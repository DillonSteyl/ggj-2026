class_name Game
extends Node2D

@onready var check_button: Button = $CheckButton
@onready var label: Label = $Label
@onready var mask_base: MaskBase = $MaskBase


func _ready() -> void:
	check_button.pressed.connect(_on_check)


func _on_check() -> void:
	label.text = mask_base.get_accessory_description()

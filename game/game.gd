class_name Game
extends Node2D

@onready var check_button: Button = $%CheckButton
@onready var label: Label = $%Label
@onready var mask_base: MaskBase = $MaskBase
@onready var accessory_panel: AccessoryPanel = $%AccessoryPanel


func _ready() -> void:
	check_button.pressed.connect(_on_check)
	accessory_panel.accessory_selected.connect(_spawn_accessory)


func _on_check() -> void:
	label.text = mask_base.get_accessory_description()


func _spawn_accessory(accessory: Accessory) -> void:
	var accessory_view = AccessoryView.from_accessory(accessory)
	accessory_view.global_position = $AccessorySpawnPoint.global_position
	accessory_view.global_position.x += randf_range(-150.0, 150.0)
	accessory_view.global_position.y += randf_range(-150.0, 150.0)
	add_child(accessory_view)

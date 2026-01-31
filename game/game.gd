class_name Game
extends Node2D

@onready var check_button: Button = $%CheckButton
@onready var label: Label = $%Label
@onready var mask_base: MaskBase = $MaskBase
@onready var accessory_panel: AccessoryPanel = $%AccessoryPanel
@onready var accessories_layer: CanvasLayer = $%AccessoriesLayer
@onready var character_queue_manager: CharacterQueueManager = $%CharacterQueueManager


func _ready() -> void:
	check_button.pressed.connect(_on_check)
	accessory_panel.accessory_selected.connect(_spawn_accessory)


func _on_check() -> void:
	print(mask_base.get_accessory_description())
	character_queue_manager.dismiss()


func _spawn_accessory(accessory: Accessory) -> void:
	var accessory_view = AccessoryView.from_accessory(accessory)
	accessories_layer.add_child(accessory_view)
	accessory_view.global_position = get_viewport().get_mouse_position()

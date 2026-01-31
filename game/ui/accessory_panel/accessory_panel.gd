class_name AccessoryPanel
extends PanelContainer

signal accessory_selected

const ACCESSORY_BUTTON_SCENE = preload("uid://bmc5p0763dbnn")

@export var accessory_list: AccessoryList

@onready var accessory_grid: GridContainer = $%AccessoryGrid


func _ready() -> void:
	for child in accessory_grid.get_children():
		child.queue_free()

	for accessory in accessory_list.accessories:
		var button: AccessoryButton = ACCESSORY_BUTTON_SCENE.instantiate()
		button.accessory = accessory
		accessory_grid.add_child(button)
		button.button_down.connect(accessory_selected.emit.bind(accessory))

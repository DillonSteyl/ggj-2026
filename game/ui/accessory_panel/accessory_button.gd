class_name AccessoryButton
extends Button

@export var accessory: Accessory

@onready var texture_rect: TextureRect = $TextureRect


func _ready() -> void:
	texture_rect.texture = accessory.texture

	mouse_entered.connect(CursorManager.set_hovering.bind(true))
	mouse_exited.connect(CursorManager.set_hovering.bind(false))

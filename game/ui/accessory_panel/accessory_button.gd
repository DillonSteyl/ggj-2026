class_name AccessoryButton
extends Button

@export var accessory: Accessory

@onready var texture_rect: TextureRect = $TextureRect
@onready var debug_label: Label = $DebugLabel


func _ready() -> void:
	texture_rect.texture = accessory.texture
	debug_label.text = accessory.debug_text

	mouse_entered.connect(CursorManager.set_hovering.bind(true))
	mouse_exited.connect(CursorManager.set_hovering.bind(false))

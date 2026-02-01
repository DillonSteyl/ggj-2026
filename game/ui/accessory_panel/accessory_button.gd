class_name AccessoryButton
extends Button

const TEXTURE_SCALE = {
	Types.AccessorySize.Small: 0.5,
	Types.AccessorySize.Medium: 0.8,
	Types.AccessorySize.Large: 1.1,
}

@export var accessory: Accessory

@onready var texture_rect: TextureRect = $TextureRect
@onready var debug_label: Label = $DebugLabel
@onready var audio: AccessoryAudio = $%AccessoryAudio


func _ready() -> void:
	texture_rect.texture = accessory.texture
	texture_rect.scale = Vector2.ONE * TEXTURE_SCALE[accessory.size] * accessory.scale_multiplier

	debug_label.text = accessory.debug_text

	mouse_entered.connect(CursorManager.set_hovering.bind(true))
	mouse_exited.connect(CursorManager.set_hovering.bind(false))
	button_down.connect(audio.play_material_sound.bind(accessory))

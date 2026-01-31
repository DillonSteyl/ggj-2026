class_name AccessoryButton
extends Button

@export var accessory: Accessory

@onready var texture_rect: TextureRect = $TextureRect


func _ready() -> void:
	texture_rect.texture = accessory.texture
	texture_rect.modulate = accessory.color

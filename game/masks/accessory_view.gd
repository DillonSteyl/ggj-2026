class_name AccessoryView
extends Node2D

@export var accessory: Accessory

@onready var texture_rect: TextureRect = $%TextureRect


func _ready() -> void:
	modulate = accessory.color
	texture_rect.texture = accessory.texture

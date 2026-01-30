## Defines the 'area' of an AccessoryView, for overlap checking
class_name AccessoryArea
extends Area2D

var accessory_view: AccessoryView


func _ready() -> void:
	accessory_view = owner as AccessoryView

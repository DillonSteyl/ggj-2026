## Defines the 'area' of an AccessoryView, for overlap checking
class_name AccessoryArea
extends Area2D

var accessory: Accessory


func _ready() -> void:
	var accessory_view = owner as AccessoryView
	accessory = accessory_view.accessory

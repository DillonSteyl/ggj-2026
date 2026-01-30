## A spot where an accessory can be dropped
class_name AccessoryDropZone
extends Area2D

var _attached_accessories: Dictionary[int, Accessory] = {}


func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)


func get_attached_accessories() -> Array[Accessory]:
	return _attached_accessories.values()


func _on_area_entered(area: Area2D) -> void:
	if not area is AccessoryArea:
		return

	var accessory_area := area as AccessoryArea
	_attached_accessories[accessory_area.owner.get_instance_id()] = accessory_area.accessory


func _on_area_exited(area: Area2D) -> void:
	_attached_accessories.erase(area.owner.get_instance_id())

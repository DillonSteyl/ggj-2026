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
	var accessory_view := accessory_area.accessory_view
	accessory_view.add_drop_zone(self)


func _on_area_exited(area: Area2D) -> void:
	if not area is AccessoryArea:
		return
	var accessory_area := area as AccessoryArea
	var accessory_view := accessory_area.accessory_view
	accessory_view.remove_drop_zone(self)


func attach_accessory(accessory_view: AccessoryView) -> void:
	_attached_accessories[accessory_view.get_instance_id()] = accessory_view.accessory
	accessory_view.attached_drop_zone = self
	accessory_view.reparent(self)


func detatch_accessory(accessory_view: AccessoryView) -> void:
	accessory_view.attached_drop_zone = null
	_attached_accessories.erase(accessory_view.get_instance_id())

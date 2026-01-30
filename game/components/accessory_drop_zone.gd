## A spot where an accessory can be dropped
class_name AccessoryDropZone
extends Area2D

var _accessories_in_area: Dictionary[int, Accessory] = {}
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
	_accessories_in_area[accessory_view.get_instance_id()] = accessory_view.accessory

	accessory_view.drag_zone.stopped_drag.connect(_attach_accessory.bind(accessory_view))


func _on_area_exited(area: Area2D) -> void:
	if not area is AccessoryArea:
		return
	var accessory_area := area as AccessoryArea

	var accessory_view := accessory_area.accessory_view
	_accessories_in_area.erase(accessory_view.get_instance_id())

	_detatch_accessory(accessory_view)


func _attach_accessory(accessory_view: AccessoryView) -> void:
	_attached_accessories[accessory_view.get_instance_id()] = accessory_view.accessory
	accessory_view.animation_player.play("attach")


func _detatch_accessory(accessory_view: AccessoryView) -> void:
	_attached_accessories.erase(accessory_view.get_instance_id())
	accessory_view.drag_zone.stopped_drag.disconnect(_attach_accessory.bind(accessory_view))

class_name MaskBase
extends Node2D

@onready var left_drop_zone: AccessoryDropZone = $%LeftDropZone
@onready var right_drop_zone: AccessoryDropZone = $%RightDropZone
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	animation_player.play("drop_in")


func get_accessory_description() -> String:
	var result_str = ""
	for accessory in left_drop_zone.get_attached_accessories():
		result_str += "Left: " + accessory._to_string() + "\n"
	for accessory in right_drop_zone.get_attached_accessories():
		result_str += "Right: " + accessory._to_string() + "\n"

	return result_str

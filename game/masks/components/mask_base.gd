class_name MaskBase
extends Node2D

@onready var left_drop_zone: AccessoryDropZone = $%LeftDropZone
@onready var right_drop_zone: AccessoryDropZone = $%RightDropZone
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var visuals: Node2D = $%Visuals
@onready var paint_button: Button = $%PaintButton

var painted_color: BottleColor:
	set = _set_painted_color


func _ready() -> void:
	animation_player.play("drop_in")
	paint_button.pressed.connect(func(): print("MASK CLICKED"))


func to_definition() -> BuiltMask:
	var mask = BuiltMask.new()

	if painted_color:
		mask.color = painted_color.color
		mask.brightness = painted_color.brightness

	for accessory in left_drop_zone.get_attached_accessories():
		var attached = AttachedAccessory.new()
		attached.size = accessory.size
		attached.material = accessory.material
		attached.placement = Types.AccessoryPlacement.Left
		mask.attached_accessories.append(attached)
	for accessory in right_drop_zone.get_attached_accessories():
		var attached = AttachedAccessory.new()
		attached.size = accessory.size
		attached.material = accessory.material
		attached.placement = Types.AccessoryPlacement.Right
		mask.attached_accessories.append(attached)

	return mask


func _set_painted_color(value: BottleColor) -> void:
	painted_color = value
	visuals.modulate = value.mask_modulate

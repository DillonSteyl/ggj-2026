class_name MaskBase
extends Node2D

signal mouse_released

@onready var left_drop_zone: AccessoryDropZone = $%LeftDropZone
@onready var right_drop_zone: AccessoryDropZone = $%RightDropZone
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var visuals: Node2D = $%Visuals
@onready var paint_zone: Control = $%PaintZone
@onready var eye_placement: Marker2D = $%EyePlacement

var _is_hovered: bool

var painted_color: BottleColor:
	set = _set_painted_color


func _ready() -> void:
	animation_player.play("drop_in")
	paint_zone.mouse_entered.connect(func(): _is_hovered = true)
	paint_zone.mouse_exited.connect(func(): _is_hovered = false)


func _input(event: InputEvent) -> void:
	if not _is_hovered:
		return

	if event is InputEventMouseButton and event.is_released():
		mouse_released.emit()


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

class_name MaskBase
extends Node2D

@onready var left_drop_zone: AccessoryDropZone = $%LeftDropZone
@onready var right_drop_zone: AccessoryDropZone = $%RightDropZone
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var visuals: Node2D = $%Visuals
@onready var paint_button: Button = $%PaintButton


func _ready() -> void:
	animation_player.play("drop_in")
	paint_button.pressed.connect(func(): print("MASK CLICKED"))


func to_definition() -> BuiltMask:
	var mask = BuiltMask.new()

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

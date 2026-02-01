class_name PaintManager
extends Node

@onready var brush: Control = $Brush

var is_painting: bool
var paint_color: BottleColor


func _ready() -> void:
	disable()


func _process(_delta: float) -> void:
	brush.global_position = get_viewport().get_mouse_position()


func set_color(color: BottleColor):
	is_painting = true
	brush.visible = true
	brush.modulate = color.mask_modulate
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	paint_color = color


func disable():
	brush.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	is_painting = false


func paint_mask(mask: MaskBase):
	# TODO: define modulation colors
	if not is_painting:
		return

	mask.painted_color = paint_color
	disable()

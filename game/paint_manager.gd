class_name PaintManager
extends Node

var is_painting: bool
var paint_color: BottleColor


func set_color(color: BottleColor):
	CursorManager.set_painting(true)
	is_painting = true
	paint_color = color


func disable():
	CursorManager.set_painting(false)
	is_painting = false


func paint_mask(mask: MaskBase):
	# TODO: define modulation colors
	if not is_painting:
		return

	mask.visuals.modulate = paint_color.mask_modulate
	disable()

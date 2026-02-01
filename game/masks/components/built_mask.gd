class_name BuiltMask
extends Resource

@export var color: Types.MaskColor = Types.MaskColor.None
@export var brightness: Types.MaskBrightness = Types.MaskBrightness.None
@export var attached_accessories: Array[AttachedAccessory]


func get_description() -> String:
	var descs = []

	var color_desc = "color: "
	color_desc += Types.BRIGHTNESS_NAMES.get(brightness, "") + " "
	color_desc += Types.COLOR_NAMES.get(color, "") + "."

	descs.append(color_desc)
	for accessory in attached_accessories:
		descs.append(accessory._to_string())

	return "\n".join(descs)

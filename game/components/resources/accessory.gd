class_name Accessory
extends Resource

@export var texture: Texture2D
# Attributes
@export var size: Types.AccessorySize
@export var material: Types.AccessoryMaterial


func _to_string() -> String:
	return (
		"A {size}, {material} thing"
		. format(
			{
				"size": Types.SIZE_NAMES[size],
				"material": Types.MATERIAL_NAMES[material],
			}
		)
	)

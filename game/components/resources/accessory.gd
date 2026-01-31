class_name Accessory
extends Resource

enum AccessorySize { Small, Large }
enum AccessoryMaterial { Metal, Paper, Wood }

const SIZE_NAMES = {
	AccessorySize.Small: "small",
	AccessorySize.Large: "large",
}
const MATERIAL_NAMES = {
	AccessoryMaterial.Metal: "metal",
	AccessoryMaterial.Paper: "paper",
	AccessoryMaterial.Wood: "wood"
}

@export var texture: Texture2D
# Attributes
@export var size: AccessorySize
@export var material: AccessoryMaterial


func _to_string() -> String:
	return (
		"A {size}, {material} thing"
		. format(
			{
				"size": SIZE_NAMES[size],
				"material": MATERIAL_NAMES[material],
			}
		)
	)

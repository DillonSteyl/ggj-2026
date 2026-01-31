class_name Types

# Medium is never requested by bugs
enum AccessorySize { None, Small, Large, Medium }

enum AccessoryMaterial { None, Metal, Paper, Wood }
enum AccessoryPlacement { None, Left, Right }

const SIZE_NAMES = {
	AccessorySize.Small: "small",
	AccessorySize.Medium: "medium",
	AccessorySize.Large: "large",
}
const MATERIAL_NAMES = {
	AccessoryMaterial.Metal: "metal",
	AccessoryMaterial.Paper: "paper",
	AccessoryMaterial.Wood: "wood"
}
const PLACEMENT_NAMES = {
	AccessoryPlacement.Left: "left",
	AccessoryPlacement.Right: "right",
}

const VALID_SIZES = [
	AccessorySize.Small,
	AccessorySize.Large,
]
const VALID_MATERIALS = [
	AccessoryMaterial.Metal,
	AccessoryMaterial.Paper,
	AccessoryMaterial.Wood,
]
const VALID_PLACEMENTS = [
	AccessoryPlacement.Left,
	AccessoryPlacement.Right,
]

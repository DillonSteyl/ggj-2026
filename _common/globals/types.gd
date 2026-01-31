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

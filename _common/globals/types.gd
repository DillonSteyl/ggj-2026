class_name Types

# Medium is never requested by bugs
enum AccessorySize { None, Small, Large, Medium }
enum AccessoryColor { None, Red, Gold, Green }
enum AccessoryColorBrightness { None, Bright, Dark }
enum AccessoryMaterial { None, Metal, Paper, Glass }
enum AccessoryPlacement { None, Left, Right }

const SIZE_NAMES = {
	AccessorySize.Small: "small",
	AccessorySize.Medium: "medium",
	AccessorySize.Large: "large",
}
const MATERIAL_NAMES = {
	AccessoryMaterial.Metal: "metal",
	AccessoryMaterial.Paper: "paper",
	AccessoryMaterial.Glass: "glass"
}
const PLACEMENT_NAMES = {
	AccessoryPlacement.Left: "left",
	AccessoryPlacement.Right: "right",
}

const VALID_SIZES = [
	AccessorySize.Small,
	AccessorySize.Large,
]
const VALID_COLORS = [
	AccessoryColor.Red,
	AccessoryColor.Gold,
	AccessoryColor.Green,
]
const VALID_BRIGHTNESS_CHOICES = [
	AccessoryColorBrightness.Bright,
	AccessoryColorBrightness.Dark,
]
const VALID_MATERIALS = [
	AccessoryMaterial.Metal,
	AccessoryMaterial.Paper,
	AccessoryMaterial.Glass,
]
const VALID_PLACEMENTS = [
	AccessoryPlacement.Left,
	AccessoryPlacement.Right,
]

class_name Types

# Medium is never requested by bugs
enum AccessorySize { None, Small, Large, Medium }
enum MaskColor { None, Red, Gold, Green }
enum MaskBrightness { None, Bright, Dark }
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
const COLOR_NAMES = {
	MaskColor.Red: "red",
	MaskColor.Gold: "yellow",
	MaskColor.Green: "green",
}
const BRIGHTNESS_NAMES = {
	MaskBrightness.Bright: "bright",
	MaskBrightness.Dark: "dark",
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
	MaskColor.Red,
	MaskColor.Gold,
	MaskColor.Green,
]
const VALID_BRIGHTNESS_CHOICES = [
	MaskBrightness.Bright,
	MaskBrightness.Dark,
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

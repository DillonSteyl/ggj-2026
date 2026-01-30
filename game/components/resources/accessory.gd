class_name Accessory
extends Resource

enum Style { Funky, Rounded }
enum ColorLabel { Red, Blue, Green, Yellow }
const STYLE_NAMES = {
	Style.Funky: "funky",
	Style.Rounded: "rounded",
}
const COLOR_NAMES = {
	ColorLabel.Red: "red",
	ColorLabel.Blue: "blue",
	ColorLabel.Green: "green",
	ColorLabel.Yellow: "yellow",
}

@export var texture: Texture2D
# Attributes
@export var style: Style
@export var color_label: ColorLabel

# Visual Modifiers
@export var color: Color


func _to_string() -> String:
	return (
		"A {color}, {style} thing"
		. format(
			{
				"color": COLOR_NAMES[color_label],
				"style": STYLE_NAMES[style],
			}
		)
	)

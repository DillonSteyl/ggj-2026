class_name InkBottle
extends TextureButton

signal selected(color: BottleColor)

@export var bottle_color: BottleColor


func _ready() -> void:
	pressed.connect(selected.emit.bind(bottle_color))

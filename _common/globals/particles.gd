extends Node

var CLICK_PARTICLE = preload("res://game/addons/mouse_click_dust.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var part = CLICK_PARTICLE.instantiate()
			add_child(part)
			part.position = event.position
			# print("Left Mouse Button Down at: ", event.position)
		# elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			# print("Left Mouse Button Up")
	pass

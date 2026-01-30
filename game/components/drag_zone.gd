class_name DragZone
extends Control

var _is_dragging: bool = false


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		_handle_mouse_button_input(event)
		return

	if _is_dragging and event is InputEventMouseMotion:
		owner.global_position += event.relative


func _handle_mouse_button_input(event: InputEventMouseButton):
	if event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			_is_dragging = true
			# drag_offset = event.position
			owner.move_to_front()
		else:
			_is_dragging = false

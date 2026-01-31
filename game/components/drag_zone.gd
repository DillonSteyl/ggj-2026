class_name DragZone
extends Control

signal started_drag
signal stopped_drag

var _is_dragging: bool = false:
	set = _set_is_dragging


func _ready() -> void:
	mouse_entered.connect(CursorManager.set_cursor.bind(CursorManager.CursorStyle.Empty))
	mouse_exited.connect(CursorManager.set_cursor.bind(CursorManager.CursorStyle.Point))


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		_handle_mouse_button_input(event)
		return

	if _is_dragging and event is InputEventMouseMotion:
		CursorManager.set_cursor(CursorManager.CursorStyle.Closed)
		owner.global_position += event.relative

	if not _is_dragging:
		CursorManager.set_cursor(CursorManager.CursorStyle.Empty)


func get_is_dragging() -> bool:
	return _is_dragging


func _handle_mouse_button_input(event: InputEventMouseButton):
	if event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			# CursorManager.set_cursor(CursorManager.CursorStyle.Closed)
			_is_dragging = true
			# drag_offset = event.position
			owner.move_to_front()
		else:
			_is_dragging = false


func _set_is_dragging(value: bool) -> void:
	if _is_dragging != value:
		if value:
			started_drag.emit()
		else:
			stopped_drag.emit()

	_is_dragging = value

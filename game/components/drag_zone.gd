class_name DragZone
extends Control

signal started_drag
signal stopped_drag

@onready var _is_dragging: bool = true:
	set = _set_is_dragging


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and _is_dragging:
		owner.global_position += event.relative
		return

	if event is InputEventMouseButton and event.is_released():
		_is_dragging = false


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if not _is_dragging and event.is_pressed():
			_is_dragging = true
			return


func get_is_dragging() -> bool:
	return _is_dragging


func _set_is_dragging(value: bool) -> void:
	if _is_dragging != value:
		if value:
			started_drag.emit()
			owner.move_to_front()
		else:
			stopped_drag.emit()

	_is_dragging = value

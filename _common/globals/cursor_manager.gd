extends Node

enum CursorStyle { Point, Open, Closed }

const POINT_TEXTURE = preload("uid://cw3rjd2oavjht")
const OPEN_TEXTURE = preload("uid://cmodo803vm2ih")
const CLOSED_TEXTURE = preload("uid://qp50uj34h3eb")

const STYLE_TEXTURES = {
	CursorStyle.Point: POINT_TEXTURE,
	CursorStyle.Open: OPEN_TEXTURE,
	CursorStyle.Closed: CLOSED_TEXTURE
}

var _current_style: CursorStyle
var _hovering: bool:
	set = set_hovering
var _holding: bool:
	set = set_holding


func _ready() -> void:
	_update_cursor()


func set_hovering(value: bool) -> void:
	_hovering = value
	_update_cursor()


func set_holding(value: bool) -> void:
	_holding = value
	_update_cursor()


func _update_cursor() -> void:
	_current_style = CursorStyle.Point
	if _hovering:
		_current_style = CursorStyle.Open
	if _holding:
		_current_style = CursorStyle.Closed
	Input.set_custom_mouse_cursor(
		STYLE_TEXTURES[_current_style], Input.CURSOR_ARROW, Vector2(16, 16)
	)

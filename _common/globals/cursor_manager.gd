extends Node

enum CursorStyle { Point, Empty, Closed }

const POINT_TEXTURE = preload("uid://cw3rjd2oavjht")
const EMPTY_TEXTURE = preload("uid://cmodo803vm2ih")
const CLOSED_TEXTURE = preload("uid://qp50uj34h3eb")

const STYLE_TEXTURES = {
	CursorStyle.Point: POINT_TEXTURE,
	CursorStyle.Empty: EMPTY_TEXTURE,
	CursorStyle.Closed: CLOSED_TEXTURE
}


func _ready() -> void:
	set_cursor()


func set_cursor(style: CursorStyle = CursorStyle.Point) -> void:
	Input.set_custom_mouse_cursor(STYLE_TEXTURES[style], Input.CURSOR_ARROW, Vector2(16, 16))
	return

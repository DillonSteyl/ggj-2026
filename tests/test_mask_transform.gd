extends Node2D

@onready var character: CharacterBase = $Cricket
@onready var mask: MaskBase = $MaskPeenor


func _ready() -> void:
	mask.global_transform = character.face_transform.global_transform.translated_local(
		-1 * mask.eye_placement.position
	)

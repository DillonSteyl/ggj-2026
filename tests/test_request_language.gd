extends Control

@export var mask_request: MaskRequest
@export var built_mask: BuiltMask

@onready var request_label: Label = $RequestLabel
@onready var mask_label: Label = $MaskLabel
@onready var match_label: Label = $MatchLabel


func _ready() -> void:
	request_label.text = mask_request.to_bug_language()
	mask_label.text = built_mask.get_description()
	match_label.text = str(mask_request.is_satisfied_by(built_mask))

class_name CharacterQueueManager
extends Node

signal character_entered
signal character_exited

@export var stages: Array[Stage] = []

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var character_base: CharacterBase = $CharacterBase

var current_request: MaskRequest
var _current_stage: Stage
var _current_stage_index: int = 0


func _ready() -> void:
	_current_stage = stages[_current_stage_index]
	next()


func dismiss(success: bool) -> void:
	if success:
		character_base.goodbye_thankyou()
	else:
		character_base.goodbye_curse()

	animation_player.play("exit")
	await animation_player.animation_finished
	next()


func next() -> void:
	# TODO: set random character
	current_request = _current_stage.request_generator.generate()
	character_base.mask_request = current_request
	animation_player.play("enter")


func _on_character_entered() -> void:
	character_entered.emit()


func _on_character_exited() -> void:
	character_exited.emit()

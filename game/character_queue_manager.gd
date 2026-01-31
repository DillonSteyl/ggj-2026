class_name CharacterQueueManager
extends Node

signal character_entered
signal character_exited

@export var stages: Array[Stage] = []

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var character_base: CharacterBase = $CharacterBase

var _current_stage: Stage
var _current_stage_index: int


func _ready() -> void:
	_current_stage = stages[0]
	next()


func dismiss() -> void:
	animation_player.play("exit")
	await animation_player.animation_finished
	next()


func next() -> void:
	# TODO: set random character
	character_base.mask_request = _current_stage.request_generator.generate()
	animation_player.play("enter")


func _on_character_entered() -> void:
	character_entered.emit()


func _on_character_exited() -> void:
	character_exited.emit()

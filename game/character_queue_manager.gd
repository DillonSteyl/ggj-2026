class_name CharacterQueueManager
extends Node

const CRICKET: PackedScene = preload("uid://drvvcpe0u3cw6")

signal character_entered
signal character_exited

@export var stages: Array[Stage] = []

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var character_position: Node2D = $%CharacterPosition

var character_base: CharacterBase
var current_request: MaskRequest
var _current_stage: Stage
var _current_stage_index: int = 0

var _stage_success_history: Array[bool] = []


func _ready() -> void:
	_current_stage = stages[_current_stage_index]
	next()


func hello() -> void:
	character_base.hello()


func dismiss(success: bool) -> void:
	_stage_success_history.append(success)
	if _stage_success_history.size() > _current_stage.from_x_last_attempts:
		_stage_success_history.pop_front()

	if success:
		character_base.goodbye_thankyou()
	else:
		character_base.goodbye_curse()

	animation_player.play("exit")
	await animation_player.animation_finished
	next()


func next() -> void:
	for child in character_position.get_children():
		child.queue_free()

	# TODO: choose a random character :)
	character_base = CRICKET.instantiate()
	character_position.add_child(character_base)

	if _stage_success_history.filter(func(val): return val).size() >= _current_stage.num_successes:
		_next_stage()

	# TODO: set random character
	current_request = _current_stage.request_generator.generate()
	character_base.mask_request = current_request
	animation_player.play("enter")


func _next_stage() -> void:
	_current_stage_index += 1
	if _current_stage_index >= stages.size():
		# TODO: end game!
		return

	_current_stage = stages[_current_stage_index]
	_stage_success_history = []


func _on_character_entered() -> void:
	character_entered.emit()


func _on_character_exited() -> void:
	character_exited.emit()

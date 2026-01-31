class_name CharacterQueueManager
extends Node

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	next()


func dismiss() -> void:
	# TODO: check validity of request, handle progression, etc.
	animation_player.play("exit")
	await animation_player.animation_finished
	next()


func next() -> void:
	# TODO: set random character
	# TODO: set mask request based on current progression
	animation_player.play("enter")

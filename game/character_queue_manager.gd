class_name CharacterQueueManager
extends Node

signal character_entered
signal character_exited

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var character_base: CharacterBase = $CharacterBase


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


func _on_character_entered() -> void:
	character_entered.emit()


func _on_character_exited() -> void:
	character_exited.emit()

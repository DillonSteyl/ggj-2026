class_name CharacterAudioManager
extends Node

@export var greet_randomizer: AudioStreamRandomizer
@export var disgruntled_randomizer: AudioStreamRandomizer
@export var confused_randomizer: AudioStreamRandomizer
@export var happy_randomizer: AudioStreamRandomizer

@onready var result_stream_player: AudioStreamPlayer = $%ResultStreamPlayer


func greet() -> void:
	result_stream_player.stream = greet_randomizer
	result_stream_player.play()


func happy() -> void:
	result_stream_player.stream = happy_randomizer
	result_stream_player.play()


func disgruntled() -> void:
	result_stream_player.stream = disgruntled_randomizer
	result_stream_player.play()


func confused() -> void:
	result_stream_player.stream = confused_randomizer
	result_stream_player.play()

class_name CharacterBase
extends Node2D

const SEC_PER_CHAR: float = 0.03

@onready var speech_label: RichTextLabel = $%SpeechLabel

var _speech_tween: Tween


func _ready() -> void:
	speech_label.visible_ratio = 0.0


func hello() -> void:
	speech_label.text = "Hee!"
	_animate_speech(0.7, true)
	_speech_tween.finished.connect(_make_request)


func goodbye() -> void:
	speech_label.text = "Tee!"
	_animate_speech(0.7, true)
	_speech_tween.finished.connect(_clear_speech)


func _clear_speech() -> void:
	if _speech_tween:
		_speech_tween.kill()

	_speech_tween = create_tween()
	_speech_tween.tween_property(speech_label, "visible_ratio", 0.0, 0.2)


func _make_request() -> void:
	speech_label.text = "Making a request, ya know?\nGive me a mask please. I'm a cute lil buggy guy."
	_animate_speech()


func _animate_speech(interval: float = 1.0, clear_speech: bool = false) -> void:
	speech_label.visible_ratio = 0.0
	if _speech_tween:
		_speech_tween.kill()

	_speech_tween = create_tween()
	_speech_tween.tween_property(
		speech_label, "visible_ratio", 1.0, SEC_PER_CHAR * speech_label.text.length()
	)
	_speech_tween.tween_interval(interval)
	if clear_speech:
		_speech_tween.tween_property(speech_label, "visible_ratio", 0.0, 0.2)

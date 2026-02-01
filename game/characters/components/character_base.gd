class_name CharacterBase
extends Node2D

const SEC_PER_CHAR: float = 0.03

@export var mask_request: MaskRequest
@export var body_textures: Array[Texture]
@export var restricted_mask_scene: PackedScene

@export_group("Expressions")
@export var happy: Texture
@export var sad: Texture
@export var normal: Texture

@onready var speech_label: RichTextLabel = $%SpeechLabel
@onready var face_transform: Node2D = $%FaceTransform
@onready var audio_manager: CharacterAudioManager = $%CharacterAudioManager

@onready var body_sprite: Sprite2D = $%BodySprite
@onready var face_sprite: Sprite2D = $%FaceSprite

var _speech_tween: Tween


func _ready() -> void:
	body_sprite.texture = body_textures.pick_random()
	speech_label.visible_ratio = 0.0


func hello() -> void:
	speech_label.text = "Hee!"
	animate_speech(0.7, true)
	_speech_tween.finished.connect(_make_request)


func goodbye_thankyou() -> void:
	face_sprite.texture = happy
	speech_label.text = "Tee!"
	animate_speech(0.7, true)
	_speech_tween.finished.connect(_clear_speech)


func goodbye_curse() -> void:
	face_sprite.texture = sad
	speech_label.text = "Ereeeee!"
	animate_speech(0.7, true)
	_speech_tween.finished.connect(_clear_speech)


func _clear_speech() -> void:
	if _speech_tween:
		_speech_tween.kill()

	_speech_tween = create_tween()
	_speech_tween.tween_property(speech_label, "visible_ratio", 0.0, 0.2)


func _make_request() -> void:
	speech_label.text = mask_request.to_bug_language()
	animate_speech()


func animate_speech(interval: float = 1.0, clear_speech: bool = false) -> void:
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

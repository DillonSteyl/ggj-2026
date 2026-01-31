class_name Game
extends Node2D

const MASK_SCENE = preload("uid://c7g4f111rim71")

@onready var submit_button: Button = $%SubmitButton
@onready var accessory_panel: AccessoryPanel = $%AccessoryPanel
@onready var accessories_layer: CanvasLayer = $%AccessoriesLayer
@onready var character_queue_manager: CharacterQueueManager = $%CharacterQueueManager
@onready var mask_spawn_point: Node2D = $%MaskSpawnPoint

var _mask_transform_tween: Tween
var _current_mask: MaskBase


func _ready() -> void:
	MusicManager.play_music(MusicManager.StreamIndex.CHARACTERS)
	submit_button.pressed.connect(_on_submit)
	accessory_panel.accessory_selected.connect(_spawn_accessory)

	character_queue_manager.character_entered.connect(_on_character_entered)
	character_queue_manager.character_exited.connect(_on_character_exited)


func _on_submit() -> void:
	var built_mask = _current_mask.to_definition()
	if character_queue_manager.current_request.is_satisfied_by(built_mask):
		_on_success()
	else:
		_on_failure()


func _on_success() -> void:
	_wear_mask()
	character_queue_manager.character_base.audio_manager.happy()
	character_queue_manager.dismiss(true)


func _on_failure() -> void:
	_current_mask.animation_player.play("destroy")
	character_queue_manager.character_base.audio_manager.disgruntled()
	character_queue_manager.dismiss(false)


func _on_character_entered() -> void:
	_current_mask = MASK_SCENE.instantiate()
	mask_spawn_point.add_child(_current_mask)


func _on_character_exited() -> void:
	_current_mask.queue_free()


func _wear_mask() -> void:
	if _mask_transform_tween:
		_mask_transform_tween.kill()

	_mask_transform_tween = create_tween()
	_mask_transform_tween.set_ease(Tween.EASE_IN_OUT)
	_mask_transform_tween.set_trans(Tween.TRANS_CUBIC)
	_mask_transform_tween.tween_property(
		_current_mask,
		"global_transform",
		character_queue_manager.character_base.face_transform.global_transform,
		0.5
	)
	_current_mask.reparent(character_queue_manager.character_base)


func _spawn_accessory(accessory: Accessory) -> void:
	var accessory_view = AccessoryView.from_accessory(accessory)
	accessories_layer.add_child(accessory_view)
	accessory_view.global_position = get_viewport().get_mouse_position()

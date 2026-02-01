class_name AccessoryView
extends Node2D
const SPRITE_SCALE = {
	Types.AccessorySize.Small: 0.15,
	Types.AccessorySize.Medium: 0.25,
	Types.AccessorySize.Large: 0.35,
}
const ACCESSORY_VIEW_SCENE = preload("uid://e1e3t1v6v2vy")

@export var accessory: Accessory

@onready var visual_parent: Node2D = $%Visuals
@onready var shadow_sprite: Sprite2D = $%ShadowSprite2D
@onready var sprite: Sprite2D = $%Sprite2D
@onready var animation_player: AnimationPlayer = $%AnimationPlayer
@onready var drag_zone: DragZone = $%DragZone
@onready var debug_label: Label = $%DebugLabel
@onready var audio: AccessoryAudio = $%AccessoryAudio

var attached_drop_zone: AccessoryDropZone

var _over_drop_zones: Dictionary[AccessoryDropZone, bool] = {}


func _ready() -> void:
	visual_parent.scale = Vector2.ONE * SPRITE_SCALE[accessory.size] * accessory.scale_multiplier
	shadow_sprite.texture = accessory.texture
	sprite.texture = accessory.texture
	debug_label.text = accessory.debug_text

	drag_zone.started_drag.connect(_on_started_drag)
	drag_zone.stopped_drag.connect(_on_stopped_drag)
	animation_player.play("pickup")


static func from_accessory(p_accessory: Accessory) -> AccessoryView:
	var instance: AccessoryView = ACCESSORY_VIEW_SCENE.instantiate()
	instance.accessory = p_accessory
	return instance


func add_drop_zone(drop_zone: AccessoryDropZone) -> void:
	_over_drop_zones[drop_zone] = true
	drag_zone.stopped_drag.connect(drop_zone.attach_accessory.bind(self))


func remove_drop_zone(drop_zone: AccessoryDropZone) -> void:
	_over_drop_zones.erase(drop_zone)
	drag_zone.stopped_drag.disconnect(drop_zone.attach_accessory.bind(self))


func _can_attach() -> bool:
	return _over_drop_zones.size() > 0


func _on_started_drag() -> void:
	if attached_drop_zone:
		attached_drop_zone.detatch_accessory(self)

	animation_player.play("pickup")
	audio.play_material_sound(accessory)


func _on_stopped_drag() -> void:
	if _can_attach():
		animation_player.play("attach")
		audio.play_material_sound(accessory)
	else:
		animation_player.play("drop")

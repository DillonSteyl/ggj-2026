class_name AccessoryView
extends Node2D

const ACCESSORY_VIEW_SCENE = preload("uid://e1e3t1v6v2vy")

@export var accessory: Accessory

@onready var shadow_sprite: Sprite2D = $%ShadowSprite2D
@onready var sprite: Sprite2D = $%Sprite2D
@onready var animation_player: AnimationPlayer = $%AnimationPlayer
@onready var drag_zone: DragZone = $%DragZone


func _ready() -> void:
	shadow_sprite.texture = accessory.texture
	sprite.texture = accessory.texture
	sprite.modulate = accessory.color

	drag_zone.started_drag.connect(_on_started_drag)
	drag_zone.stopped_drag.connect(animation_player.play.bind("drop"))


static func from_accessory(p_accessory: Accessory) -> AccessoryView:
	var instance: AccessoryView = ACCESSORY_VIEW_SCENE.instantiate()
	instance.accessory = p_accessory
	return instance


func _on_started_drag() -> void:
	animation_player.play("pickup")

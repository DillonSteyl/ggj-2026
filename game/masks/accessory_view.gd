class_name AccessoryView
extends Node2D

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


func _on_started_drag() -> void:
	animation_player.play("pickup")

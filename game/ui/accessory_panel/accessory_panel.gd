class_name AccessoryPanel
extends Control

signal accessory_selected

const ACCESSORY_BUTTON_SCENE = preload("uid://bmc5p0763dbnn")

@export var accessory_list: AccessoryList

@onready var accessory_grid: GridContainer = $%AccessoryGrid
@onready var lock: Panel = $Locked
@onready var lock_anim_player: AnimationPlayer = $%LockAnimationPlayer


func _ready() -> void:
	for child in accessory_grid.get_children():
		child.queue_free()

	for accessory in accessory_list.accessories:
		var button: AccessoryButton = ACCESSORY_BUTTON_SCENE.instantiate()
		button.accessory = accessory
		accessory_grid.add_child(button)
		button.button_down.connect(accessory_selected.emit.bind(accessory))


func is_locked() -> bool:
	return lock.visible


func unlock() -> void:
	lock_anim_player.play("unlock")

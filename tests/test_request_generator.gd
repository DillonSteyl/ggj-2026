extends Control

@export var request_generator: RequestGenerator


func _ready() -> void:
	$Button.pressed.connect(_generate)


func _generate() -> void:
	var request = request_generator.generate()
	# print(request.accessory_requests)
	$Label.text = request.to_bug_language()

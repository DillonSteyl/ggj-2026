class_name BuiltMask
extends Resource

@export var attached_accessories: Array[AttachedAccessory]


func get_description() -> String:
	var descs = []
	for accessory in attached_accessories:
		descs.append(accessory._to_string())

	return "\n".join(descs)

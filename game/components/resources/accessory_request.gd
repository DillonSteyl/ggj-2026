class_name AccessoryRequest
extends Resource

@export var size: Types.AccessorySize
@export var material: Types.AccessoryMaterial
@export var placement: Types.AccessoryPlacement


func get_bug_phrase() -> String:
	var words = []
	if size != Types.AccessorySize.None:
		words.append(BugWords.SIZE[size])
	if material != Types.AccessoryMaterial.None:
		words.append(BugWords.MATERIAL[material])
	if placement != Types.AccessoryPlacement.None:
		words.append(BugWords.PLACEMENT[placement])

	return " ".join(words)

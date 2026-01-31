class_name AttachedAccessory
extends Resource

@export var size: Types.AccessorySize
@export var material: Types.AccessoryMaterial
@export var placement: Types.AccessoryPlacement


func get_matches_request(request: AccessoryRequest) -> bool:
	if (request.size != Types.AccessorySize.None) and (size != request.size):
		return false
	if (request.material != Types.AccessoryMaterial.None) and (material != request.material):
		return false
	if (request.placement != Types.AccessoryPlacement.None) and (placement != request.placement):
		return false
	return true


func _to_string() -> String:
	return "A {size}, {material} thing on the {placement}".format(
		{
			"size": Types.SIZE_NAMES.get(size, "none"),
			"material": Types.MATERIAL_NAMES.get(material, "none"),
			"placement": Types.PLACEMENT_NAMES.get(placement, "none")
		}
	)

class_name RequestGenerator
extends Resource

@export var min_accessory_requests: int
@export var max_accessory_requests: int

# TODO: restrict number of simultaneous qualifiers?
# @export var max_accessory_qualifiers: int
@export var allow_size: bool
@export var allow_material: bool
@export var allow_placement: bool


func generate() -> MaskRequest:
	var mask_request = MaskRequest.new()
	mask_request.accessory_requests = _generate_accessory_requests()
	return mask_request


func _generate_accessory_requests() -> Array[AccessoryRequest]:
	var attribute_flags = {
		"size": allow_size, "material": allow_material, "placement": allow_placement
	}
	for key in attribute_flags.keys():
		if not attribute_flags.get(key, false):
			attribute_flags.erase(key)

	var max_qualifiers = attribute_flags.size()
	if max_qualifiers == 0:
		return []
	var num_accessories = randi_range(min_accessory_requests, max_accessory_requests)
	var requests: Array[AccessoryRequest] = []
	for i in range(num_accessories):
		var req = AccessoryRequest.new()

		var possible_attributes = attribute_flags.keys().duplicate()
		var num_qualifiers = randi_range(1, possible_attributes.size())
		var chosen_attributes = []
		for j in range(num_qualifiers):
			var attribute = possible_attributes.pick_random()
			possible_attributes.erase(attribute)
			chosen_attributes.append(attribute)

		if "size" in chosen_attributes:
			req.size = Types.VALID_SIZES.pick_random()
		if "material" in chosen_attributes:
			req.material = Types.VALID_MATERIALS.pick_random()
		if "placement" in chosen_attributes:
			req.placement = Types.VALID_PLACEMENTS.pick_random()

		requests.append(req)
	return requests

class_name MaskRequest
extends Resource

@export var color: Types.MaskColor = Types.MaskColor.None
@export var brightness: Types.MaskBrightness = Types.MaskBrightness.None
@export var accessory_requests: Array[AccessoryRequest] = []


func to_bug_language() -> String:
	# TODO: mask colors
	var mask_request_str = _get_mask_request_bug_language()
	var accessory_request_str = _get_accessory_bug_language()

	return mask_request_str + "\n" + accessory_request_str


func _get_mask_request_bug_language() -> String:
	var req = BugWords.MASK
	if brightness:
		req += " {brightness_word}".format({"brightness_word": BugWords.BRIGHTNESS[brightness]})
	if color:
		req += " {color_word}".format({"color_word": BugWords.COLOR[color]})

	return req + "."


func _get_accessory_bug_language() -> String:
	if accessory_requests.size() == 0:
		return ""

	var request_phrases = []
	for req in accessory_requests:
		request_phrases.append(req.get_bug_phrase())
	var combined_accessory_request = BugWords.AND.join(request_phrases)
	return combined_accessory_request + "."


func is_satisfied_by(mask: BuiltMask) -> bool:
	if (color != Types.MaskColor.None) and (mask.color != color):
		return false
	if (brightness != Types.MaskBrightness.None) and (mask.brightness != brightness):
		return false

	var accessories_used: Dictionary[AttachedAccessory, bool] = {}
	for accessory in mask.attached_accessories:
		accessories_used[accessory] = false

	for req in accessory_requests:
		if not _check_request_met(mask, req, accessories_used):
			return false

	print_debug("accessories used", accessories_used)
	var unused_accessories = accessories_used.keys().filter(
		func(k): return not accessories_used.get(k)
	)
	print_debug("unused accessories", unused_accessories)
	if unused_accessories.size() > 0:
		return false

	return true


func _check_request_met(
	mask: BuiltMask,
	request: AccessoryRequest,
	accessories_used: Dictionary[AttachedAccessory, bool],
) -> bool:
	# TODO: do we need to mark certain accessories as 'used'?
	var any_used = false
	for accessory in mask.attached_accessories:
		print_debug(accessory, " compared with ", request)
		var matches_request = accessory.get_matches_request(request)
		print_debug(matches_request)
		accessories_used[accessory] = accessories_used[accessory] or matches_request
		print_debug(accessories_used)
		if matches_request:
			any_used = true
		print_debug("-------")

	return any_used

class_name MaskRequest
extends Resource

@export var accessory_requests: Array[AccessoryRequest] = []


func to_bug_language() -> String:
	# TODO: mask colors
	return _get_accessory_bug_language()


func _get_accessory_bug_language() -> String:
	if accessory_requests.size() == 0:
		return ""

	var request_phrases = []
	for req in accessory_requests:
		request_phrases.append(req.get_bug_phrase())
	var combined_accessory_request = BugWords.AND.join(request_phrases)
	return BugWords.ACCESSORY + " " + combined_accessory_request


func is_satisfied_by(mask: BuiltMask) -> bool:
	# TODO: check base mask attribute

	# If customer requests accessories, they must all be met
	var all_accessory_requests_met: bool = true

	var accessories_used: Dictionary[AttachedAccessory, bool] = {}
	for accessory in mask.attached_accessories:
		accessories_used[accessory] = false

	for req in accessory_requests:
		if not _check_request_met(mask, req, accessories_used):
			return false

	var unused_accessories = accessories_used.keys().filter(
		func(k): return not accessories_used.get(k)
	)
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
		var matches_request = accessory.get_matches_request(request)
		accessories_used[accessory] = matches_request
		if matches_request:
			any_used = true

	return any_used

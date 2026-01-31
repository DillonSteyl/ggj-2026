class_name MaskRequest
extends Resource

@export var accessory_requests: Array[AccessoryRequest] = []


func to_bug_language() -> String:
	# TODO: mask colors
	return _get_accessory_bug_language()


func _get_accessory_bug_language():
	if accessory_requests.size() == 0:
		return null

	var request_phrases = []
	for req in accessory_requests:
		request_phrases.append(req.get_bug_phrase())
	var combined_accessory_request = BugWords.AND.join(request_phrases)
	return BugWords.ACCESSORY + " " + combined_accessory_request


func is_satisfied_by(mask: BuiltMask) -> bool:
	# TODO: check base mask attribute

	# If customer requests accessories, they must all be met
	var all_accessory_requests_met: bool = true
	for req in accessory_requests:
		if not _check_request_met(mask, req):
			all_accessory_requests_met = false
			break
	return all_accessory_requests_met


func _check_request_met(mask: BuiltMask, request: AccessoryRequest) -> bool:
	# TODO: do we need to mark certain accessories as 'used'?
	for accessory in mask.attached_accessories:
		if accessory.get_matches_request(request):
			return true

	return false

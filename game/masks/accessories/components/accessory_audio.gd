class_name AccessoryAudio
extends AudioStreamPlayer

const MATERIAL_SOUNDS: Dictionary[Types.AccessoryMaterial, AudioStream] = {
	Types.AccessoryMaterial.Paper: preload("uid://de3fpmaqmma8j"),
	Types.AccessoryMaterial.Glass: preload("uid://chatj8hmwlo8u"),
	Types.AccessoryMaterial.Metal: preload("uid://cdaiuf4uawabk"),
}


func play_material_sound(accessory: Accessory) -> void:
	stream = MATERIAL_SOUNDS.get(accessory.material)
	if stream:
		pitch_scale = randf_range(0.9, 1.1)
		# HACKY!!!
		if accessory.material == Types.AccessoryMaterial.Glass:
			pitch_scale = randf_range(1.1, 1.2)
			volume_db = -12.0
		if accessory.material == Types.AccessoryMaterial.Metal:
			pitch_scale = randf_range(0.7, 0.8)
			volume_db = -12.0

		play()

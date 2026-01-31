extends Node

const MUSIC_SET: AudioStreamSynchronized = preload("uid://by1onn52wx2pq")
const StreamIndex = {
	MENU = 0,
	CHARACTERS = 1,
	HALFTIME = 2,
}
const FADE_DURATION: float = 1.0

@onready var audio_stream_player: AudioStreamPlayer


func _ready() -> void:
	audio_stream_player = AudioStreamPlayer.new()
	add_child(audio_stream_player)
	audio_stream_player.stream = MUSIC_SET
	audio_stream_player.play()


func play_music(stream_index: int) -> void:
	var tween = create_tween()
	tween.set_parallel(true)

	var current_volume = db_to_linear(MUSIC_SET.get_sync_stream_volume(stream_index))
	tween.tween_method(_set_volume.bind(stream_index), current_volume, 1.0, FADE_DURATION)

	for i in StreamIndex.values():
		if i != stream_index:
			var vol = db_to_linear(MUSIC_SET.get_sync_stream_volume(i))
			tween.tween_method(_set_volume.bind(i), vol, 0.0, FADE_DURATION)


func _set_volume(volume_linear: float, index: int):
	MUSIC_SET.set_sync_stream_volume(index, linear_to_db(volume_linear))

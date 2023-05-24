extends Node2D

@export var bpm : float = 180
@export var bar_size : int = 4
@export var beats_per_bar: int = 4

var current_beat : int = 0
var current_bar : int = 0
var beat_length_ms : float = 0
var track_length : int = 0
var offset : int = 0

signal beat_completed(current, length)
signal bar_completed(current, length)




# Called when the node enters the scene tree for the first time.
func _ready():
	beat_length_ms = (60 / bpm) * 1000
	track_length = $Track.stream.get_length()
	Random.set_seed(track_length)
	$Track.play()

func _physics_process(_delta):
	if $Track.playing:
		var play_time : float = $Track.get_playback_position() * 1000
		var next_beat : int = current_beat + 1
		var next_beat_time : float = (next_beat * beat_length_ms) + offset
		
		# Advise active effects of measure changes
		if play_time > next_beat_time:
			current_beat = next_beat
			emit_signal("beat_completed", current_beat, beat_length_ms)
			if current_beat % beats_per_bar == 0:
				current_bar = current_bar + 1
				emit_signal("bar_completed", current_bar, beat_length_ms * beats_per_bar)
		


func _on_track_finished():
	get_tree().quit()

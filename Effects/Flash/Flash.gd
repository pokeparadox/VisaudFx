extends Effect

var flash_on : bool = false
var frames : int = 0

func _process(delta):
	frames = frames + 1
	if flash_on and frames > duration:
		$ColorRect.hide()
		flash_on = false

func next_colour() -> void:
	var r : float = Random.next_int_range(0, 255) / 255.0
	var g : float = Random.next_int_range(0, 255) / 255.0
	var b : float = Random.next_int_range(0, 255) / 255.0
	$ColorRect.color = Color(r,g,b)

func play(current_beat : int, length : float):
	flash_on = true
	frames = 0
	duration = max(length/400.0, 5.0)
	$ColorRect.show()

extends Effect

var target_colour : Color = Color.WHITE
var fade : bool = true

func _ready():
	$ColorRect.color = Color.BLACK

func get_colour_direction(diff : float) -> int:
	if diff < 0:
		return 1
	else:
		return -1

func _process(delta):
	if fade:
		var c : Color = $ColorRect.color
		var t : Color = target_colour
		var r_dir : float = get_colour_direction(c.r - t.r)
		var g_dir : float = get_colour_direction(c.g - t.g)
		var b_dir : float = get_colour_direction(c.b - t.b)
		var to_add : Color = Color(r_dir * 0.1 * delta,g_dir * 0.1 * delta, b_dir * 0.1 * delta)
		$ColorRect.color = $ColorRect.color + to_add

func next_colour(transition_duration : int) -> void:
	var r : float = Random.next_int_range(0, 255) / 255.0
	var g : float = Random.next_int_range(0, 255) / 255.0
	var b : float = Random.next_int_range(0, 255) / 255.0
	target_colour = Color(r,g,b)
	duration = transition_duration
	
	if duration <= 0:
		$ColorRect.color = target_colour

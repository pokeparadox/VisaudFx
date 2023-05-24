extends Effect

var base_speed : float = 0.01
var burst_speed : float = 0.0
var max_scale : float = 0.0
var falling : bool = false
var spin_direction : int = 1

func reverse_spin_direction() -> void:
	spin_direction = -spin_direction

func _physics_process(delta):
	if burst_speed > 0:
		burst_speed = burst_speed * 0.5
	
	if max_scale > 0.1:
		$Sprite2D.show()
		if falling:
			max_scale = max_scale - 0.05
	else:
		$Sprite2D.hide()
		
	if max_scale <= -0.9:
		$Sprite2D.scale = Vector2(2,2)
	else:
		$Sprite2D.scale = Vector2(max_scale, max_scale)
	
	$Sprite2D.rotate((base_speed + burst_speed) * spin_direction)

func set_max_scale(sc : float):
	max_scale = sc

func spin(spin : float):
	burst_speed = spin

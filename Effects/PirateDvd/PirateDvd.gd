extends Effect

var heading : Vector2 = Vector2(1, 1)
var res : Vector2 = Vector2(1280, 720)
var trails : bool = false

func change_colour() -> void:
	$Sprite2D.modulate = Color(Random.next_float_range(0.0, 1.0), Random.next_float_range(0.0, 1.0), Random.next_float_range(0.0, 1.0))

func _physics_process(delta):
	$Sprite2D/GPUParticles2D.emitting = trails and visible
	
	if not visible:
		$Sprite2D/GPUParticles2D.restart()
	
	var old_pos : Vector2 = $Sprite2D.position
	var new_pos : Vector2 = old_pos + (heading * 100 * delta)
	var contact : bool = false
	
	if new_pos.x < 0:
		heading.x = 1
		contact = true
	if new_pos.y < 0:
		heading.y = 1
		contact = true
	if new_pos.x > res.x:
		heading.x = -1
		contact = true
	if new_pos.y > res.y:
		heading.y = -1
		contact = true
			
	if contact:
		$Sprite2D.position = old_pos
		change_colour()
	else:
		$Sprite2D.position = new_pos

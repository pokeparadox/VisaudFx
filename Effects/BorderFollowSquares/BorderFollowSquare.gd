extends Node2D
const offset : int = 16
const width : int = 40
const speed : float = 360.0
var heading : Vector2 = Vector2(-1, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var p : Vector2 = $ColorRect.position
	var new_p : Vector2 = p + (speed * delta * heading)
	
	if new_p.x < offset:
		heading = Vector2(0, 1)
	if new_p.y + width + offset > 720:
		heading = Vector2(1, 0) 
	if new_p.x + width + offset > 1280:
		heading = Vector2(0, -1)
	if new_p.y < offset:
		queue_free()
	
	$ColorRect.position = new_p

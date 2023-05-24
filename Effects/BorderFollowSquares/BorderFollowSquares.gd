extends Node2D

var Square = load("res://Effects/BorderFollowSquares/BorderFollowSquare.tscn")

var colour : Color = Color.WHITE

func next_colour() -> void:
	var r : float = Random.next_int_range(0, 255) / 255.0
	var g : float = Random.next_int_range(0, 255) / 255.0
	var b : float = Random.next_int_range(0, 255) / 255.0
	colour = Color(r,g,b)

func add_square() -> void:
	var sq = Square.instantiate()
	sq.modulate = colour
	add_child(sq)

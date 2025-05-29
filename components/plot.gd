@icon("res://components/plot-icon.svg")
class_name Plot extends Line2D


@export var max_value: float = 100
@export var min_value: float = 0
@export_range(2, 1000) var points_count: int = 100


var bounds: Vector2
var delta_pos: Vector2


func _ready() -> void:
	var parent = get_parent() as Control
	bounds = parent.size
	delta_pos = Vector2(-bounds.x/(points_count-1), 0)


func update_clamp(value: float):
	var new_val = clampf(value, min_value, max_value)
	var new_point = Vector2(
		bounds.x,
		bounds.y * (1 - new_val/(max_value - min_value))
	)
	for i in range(len(points)):
		points[i] += delta_pos
	add_point(new_point)
	if points.size() > points_count:
		remove_point(0)

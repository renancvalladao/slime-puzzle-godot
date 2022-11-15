extends Node

var Util = preload("res://scripts/util.gd")
var tile_size = Util.tile_size
var paint_area = preload("res://scenes/paint_area.tscn")
export(Vector2) var top_left
export(Vector2) var bottom_right

func _ready():
	for x in range(top_left.x, bottom_right.x + tile_size, tile_size):
		for y in range(top_left.y, bottom_right.y + tile_size, tile_size):
			var paint_area_node = paint_area.instance()
			paint_area_node.position = Vector2(x, y)
			add_child(paint_area_node)

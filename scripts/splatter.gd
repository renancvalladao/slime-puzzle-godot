extends StaticBody2D

const Util = preload("res://scripts/util.gd")
export(Util.Colors) var color

func _ready():
	set_collision_layer_bit(color + 3, true)

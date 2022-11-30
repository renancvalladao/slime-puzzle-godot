extends StaticBody2D

var Util = preload("res://scripts/util.gd")
var sprites = {
	Util.Colors.BLUE: preload("res://assets/splatter_blue.png"),
	Util.Colors.ORANGE: preload("res://assets/splatter_orange.png"),
	Util.Colors.YELLOW: preload("res://assets/splatter_yellow.png")
}

func set_color(color):
	$Sprite.texture = sprites[color]
	set_collision_layer_bit(color + 3, true)

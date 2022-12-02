extends Area2D

const Util = preload("res://scripts/util.gd")
var sprites = {
	Util.Colors.BLUE: preload("res://assets/splatter_blue.png"),
	Util.Colors.ORANGE: preload("res://assets/splatter_orange.png"),
	Util.Colors.YELLOW: preload("res://assets/splatter_yellow.png")
}
var color
export(Util.Colors) var init_color

func _ready():
	if init_color != Util.Colors.NO_COLOR:
		add_to_group("not_paintable")
		set_color(init_color)
		var _connect = connect("body_entered", self, "_body_entered")

func _body_entered(other: Node):
	if (other.has_method("change_color")):
		other.change_color(color)
		disconnect("body_entered", self, "_body_entered")

func set_color(_color):
	color = _color
	$Sprite.texture = sprites[color]
	set_collision_layer_bit(color + 3, true)

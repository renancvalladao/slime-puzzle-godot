extends Area2D

var Util = preload("res://scripts/util.gd")
var splatters = {
	Util.Colors.BLUE: preload("res://scenes/splatter_blue.tscn"),
	Util.Colors.ORANGE: preload("res://scenes/splatter_orange.tscn")
}

func _ready():
	connect("body_entered", self, "_body_entered")

func _body_entered(other: Node):
	if (other.has_method("get_color")):
		var color = other.get_color()
		if color != Util.Colors.NO_COLOR:
			var splatter_node = splatters[color].instance()
			splatter_node.position = position
			var parent = get_parent()
			parent.call_deferred("add_child", splatter_node)
			#parent.add_child(splatter_node)
			queue_free()

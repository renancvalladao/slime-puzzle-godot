extends Area2D

var Util = preload("res://scripts/util.gd")
var splatter = preload("res://scenes/splatter.tscn")

func _ready():
	var _connect = connect("body_entered", self, "_body_entered")

func _body_entered(other: Node):
	if (other.has_method("get_color")):
		var color = other.get_color()
		if color != Util.Colors.NO_COLOR:
			var splatter_node = splatter.instance()
			splatter_node.position = position
			splatter_node.set_color(color)
			var parent = get_parent()
			parent.call_deferred("add_child", splatter_node)
			queue_free()

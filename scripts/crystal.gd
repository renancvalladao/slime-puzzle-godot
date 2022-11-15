extends Area2D

const Util = preload("res://scripts/util.gd")
export(Util.Colors) var color

func _ready():
	connect("body_entered", self, "_body_entered")

func _body_entered(other: Node):
	if (other.has_method("change_color")):
		other.change_color(color)
		queue_free()

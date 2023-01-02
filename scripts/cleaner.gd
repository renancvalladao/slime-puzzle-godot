extends Area2D

const Util = preload("res://scripts/util.gd")

func _ready():
	add_to_group("not_paintable")
	var _connect = connect("body_entered", self, "_body_entered")
	$AnimationPlayer.play("idle")

func _body_entered(other: Node):
	if (other.has_method("change_color")):
		other.change_color(Util.Colors.NO_COLOR)

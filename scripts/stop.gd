extends Area2D

func _ready():
	add_to_group("not_paintable")
	var _connect = connect("body_entered", self, "_body_entered")

func _body_entered(other: Node):
	if (other.get_parent().has_method("stop_movement")):
		other.get_parent().stop_movement()

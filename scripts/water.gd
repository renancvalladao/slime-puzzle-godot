extends Area2D

func _ready():
	var _connect = connect("body_entered", self, "_body_entered")

func _body_entered(other: Node):
	if (other.has_method("die")):
		other.die()

extends Area2D

func _ready():
	var _connect = connect("body_entered", self, "_body_entered")

func _body_entered(_other: Node):
	queue_free()

extends Area2D

func _ready():
	connect("body_entered", self, "_body_entered")

func _body_entered(_other: Node):
	queue_free()

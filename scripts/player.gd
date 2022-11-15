extends KinematicBody2D

const Util = preload("res://scripts/util.gd")
var velocity: Vector2
var speed: int = 100
var color = Util.Colors.NO_COLOR
var sprites = {
	Util.Colors.NO_COLOR: preload("res://assets/slime_no_color.png"),
	Util.Colors.BLUE: preload("res://assets/slime_blue.png"),
	Util.Colors.ORANGE: preload("res://assets/slime_orange.png")
}
onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var sprite: Sprite = $Sprite

func _physics_process(_delta: float) -> void:
	if velocity == Vector2.ZERO:
		var direction_vector: Vector2 = Vector2(
			Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
			Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		)
		velocity = direction_vector * speed
	
	velocity = move_and_slide(velocity)
	
	if velocity != Vector2.ZERO:
		animation_player.play("walk")
	else:
		position = position.snapped(Vector2(8, 8))
		animation_player.play("idle")

	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true

func change_color(new_color) -> void:
	sprite.texture = sprites[new_color]
	color = new_color

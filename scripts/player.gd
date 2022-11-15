extends KinematicBody2D

var velocity: Vector2
var speed: int = 100
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

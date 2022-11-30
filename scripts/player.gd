extends KinematicBody2D

const minimum_drag: int = 4
var Util = preload("res://scripts/util.gd")
var tile_size = Util.tile_size
var velocity: Vector2
var speed: int = 100
var color = Util.Colors.NO_COLOR
var sprites = {
	Util.Colors.NO_COLOR: preload("res://assets/slime_no_color.png"),
	Util.Colors.BLUE: preload("res://assets/slime_blue.png"),
	Util.Colors.ORANGE: preload("res://assets/slime_orange.png"),
	Util.Colors.YELLOW: preload("res://assets/slime_yellow.png")
}
onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var sprite: Sprite = $Sprite
onready var ray_cast: RayCast2D = $RayCast2D

func _physics_process(_delta: float) -> void:
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
	
	if ray_cast.is_colliding():
		velocity = Vector2.ZERO
		position = position.snapped(Vector2(tile_size / 2, tile_size / 2))
	else:
		velocity = move_and_slide(velocity)
	
	if velocity != Vector2.ZERO:
		animation_player.play("walk")
	else:
		animation_player.play("idle")

func _unhandled_input(event: InputEvent) -> void:
	if velocity != Vector2.ZERO:
		return

	if event is InputEventScreenDrag:
		var relative: Vector2 = event.get_relative()
		var move_direction: Vector2
		if relative.x < -minimum_drag:
			move_direction = Vector2.LEFT
		elif relative.x > minimum_drag:
			move_direction = Vector2.RIGHT
		elif relative.y < -minimum_drag:
			move_direction = Vector2.UP
		elif relative.y > minimum_drag:
			move_direction = Vector2.DOWN
		ray_cast.position = move_direction * (tile_size / 2)
		ray_cast.cast_to = move_direction
		velocity = move_direction * speed

func change_color(new_color) -> void:
	sprite.texture = sprites[new_color]
	ray_cast.set_collision_mask_bit(new_color + 3, false)
	if color != Util.Colors.NO_COLOR:
		ray_cast.set_collision_mask_bit(color + 3, true)
	color = new_color

func get_color():
	return color

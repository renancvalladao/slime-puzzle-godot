extends CanvasLayer

signal reset_game

func _on_TextureButton_pressed():
	emit_signal("reset_game")

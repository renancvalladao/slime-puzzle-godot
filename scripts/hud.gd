extends CanvasLayer

signal reset_game
signal level_select

func _on_ResetButton_pressed():
	emit_signal("reset_game")

func _on_BackButton_pressed():
	emit_signal("level_select")

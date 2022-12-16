extends Node2D

func reset_game():
	var _error = get_tree().reload_current_scene()

func level_select():
	var _error = get_tree().change_scene("res://scenes/level_selector.tscn")

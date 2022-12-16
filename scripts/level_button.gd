extends Button

export(PackedScene) var scene

func _on_LevelButton_pressed():
	var _error = get_tree().change_scene_to(scene)

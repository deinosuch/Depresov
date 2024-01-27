extends Control



func _on_play_pressed():
	get_tree().root.get_child(1).unpause()

func _on_quit_pressed():
	get_tree().quit()

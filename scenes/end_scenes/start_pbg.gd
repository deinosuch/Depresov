extends Control

@onready var game = get_node("/root/GameData")

func _on_nine_patch_rect_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			game.quit()

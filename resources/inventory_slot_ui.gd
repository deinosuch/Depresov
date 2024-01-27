extends Panel

@onready var game: GameData = get_node("/root/GameData")

@onready var texture: TextureRect = $CenterContainer/TextureRect
var slot: Slot

func is_empty():
	return !slot or slot.is_empty()

func update():
	if is_empty():
		texture.visible = false
	else:
		texture.visible = true
		texture.texture = slot.item.texture

func _on_gui_input(event):
	if is_empty():
		return
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			slot.item.use(game.current_level.current_person)
			slot.amount -= 1
			game.current_level._update_stats()
			update()

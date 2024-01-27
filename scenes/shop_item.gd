extends CenterContainer

var item : Item
@onready var game_state = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			game_state.money -= item.price
			print(game_state.money)

func initialize(item_arg : Item):
	item = item_arg
	var rect = $TextureRect
	rect.texture = item.texture
	add_child(rect)

extends CenterContainer

class_name ShopItem

var item : Item
@onready var game_state = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("gui_input", _on_gui_input)
	var rect = TextureRect.new()
	rect.texture = item.texture
	rect.set_expand_mode(1)
	rect.custom_minimum_size = Vector2(100, 100)
	add_child(rect)

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			game_state.money -= item.price

func _init(item_arg : Item):
	item = item_arg

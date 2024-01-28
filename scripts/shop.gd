extends Control

@onready var total_price_label : Label = $Label
@onready var game_state = get_node("/root/GameData")

var total_price : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var directory_path : String = "res://resources/items/"
	total_price_label.text = str(total_price)
	
	var i = 0
	for filename in DirAccess.get_files_at(directory_path):
		var item = load(directory_path + filename)
		$Panel/GridContainer.get_child(i).initialize(item)
		i+=1
		if(i == 16):
			break

func add_to_total(amount : int):
	total_price += amount
	total_price_label.text = str(total_price)
	
	# coloring based on money
	if total_price > game_state.money:
		total_price_label.add_theme_color_override("font_color", Color.PALE_VIOLET_RED)
	else:
		total_price_label.add_theme_color_override("font_color", Color.WHITE)
		

func _unhandled_key_input(event):
	if event.pressed and event.keycode == KEY_ESCAPE:
		$Pause.show()

func unpause():
	$Pause.hide()

func _on_nine_patch_rect_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if total_price > game_state.money:
				return
			game_state.money -= total_price
			total_price = 0
			# increase day counter
			game_state.bar.update()
			game_state.next_day()

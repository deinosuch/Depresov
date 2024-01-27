extends Panel

var item : Item
@onready var game_state = get_node("/root/GameData")

@onready var texture: TextureRect = $CenterContainer/TextureRect

@onready var stat: Label = $StatPanel/StatSheet/Stat
@onready var stat_panel: Panel = $StatPanel

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
	texture.texture = item.texture
	
	stat_panel.visible = false
	var stat_sheet = stat.get_parent()
	stat.queue_free()
	
	var stats = item.get_stats()
	for i in range(stats.size()):
		var stat_new = stat.duplicate()
		var text = "%s: %s" % [item.stat_names[i], stats[i]]
		stat_new.text = text
		stat_sheet.add_child(stat_new)
		
	stat_sheet.add_child(stat.duplicate())
	var price = stat.duplicate()
	price.text = "Price: %s" % [item.price]
	stat_sheet.add_child(price)

func _on_mouse_entered():
	stat_panel.visible = true

func _on_mouse_exited():
	stat_panel.visible = false

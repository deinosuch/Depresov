extends Panel

var item : Item
@onready var game_state = get_node("/root/GameData")

@onready var texture: TextureRect = $CenterContainer/TextureRect

@onready var stat: Label = $StatPanel/StatSheet/Stat
@onready var stat_panel: Panel = $StatPanel

@onready var shop : Control = get_tree().root.get_child(1)
@onready var amount_label : Label = $ColorRect/Label

var amount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

#func _on_gui_input(event):
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#if total_price.text > game_state.money:
				#return
			#game_state.money -= total_price.text
			#print(game_state.money)

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


func _on_minus_pressed():
	if amount == 0:
		return
	game_state.inventory.add(item, -1)
	amount -= 1
	amount_label.text = str(amount)
	shop.add_to_total(-item.price)

func _on_plus_pressed():
	if amount == 99:
		return
	game_state.inventory.add(item, 1)
	amount += 1
	amount_label.text = str(amount)
	shop.add_to_total(item.price)
	

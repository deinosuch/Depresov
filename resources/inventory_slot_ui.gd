extends Panel

@onready var game: GameData = get_node("/root/GameData")

@onready var count: Label = $CountPanel/Count
@onready var texture: TextureRect = $CenterContainer/TextureRect

@onready var stat: Label = $StatPanel/StatSheet/Stat
@onready var stat_panel: Panel = $StatPanel

var slot: Slot

func initialize(slot: Slot):
	stat_panel.visible = false
	self.slot = slot
	update()
	
	if is_empty():
		return
		
	var stat_sheet = stat.get_parent()
	
	stat.queue_free()
	
	var stats = self.slot.item.get_stats()
	for i in range(stats.size()):
		var stat_new = stat.duplicate()
		var text = "%s: %s" % [self.slot.item.stat_names[i], stats[i]]
		stat_new.text = text
		stat_sheet.add_child(stat_new)
	#var stat_new = stat.duplicate()
	#stat_new.text = "AAAAAAA"
	#stat_sheet.add_child(stat_new)

func is_empty():
	return !slot or slot.is_empty()

func update():
	if is_empty():
		visible = false
	else:
		visible = true
		texture.texture = slot.item.texture
		count.text = str(slot.amount)


func _on_gui_input(event):
	if is_empty():
		return
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			slot.item.use(game.current_level.current_person)
			slot.amount -= 1
			game.current_level.stat_bar.update()
			update()
			
			game.end_condition()


func _on_mouse_entered():
	stat_panel.visible = true


func _on_mouse_exited():
	stat_panel.visible = false

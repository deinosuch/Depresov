extends Control


@onready var game_data = get_node("/root/GameData")
@onready var grid = $GridContainer
		

func initialize():
	var stat_names = game_data.current_level.current_person.stat_names
	var bar = grid.get_child(0)
	grid.remove_child(bar)
	bar.queue_free()
	for name in stat_names:
		var label = Label.new()
		label.text = name
		grid.add_child(label)
		
		var new_bar = bar.duplicate()
		grid.add_child(new_bar)
		
	update()

func update():
	if game_data.current_level.current_person == null: return # idk man, it works now
	var person_stats = game_data.current_level.current_person.get_stats()
	
	for i in range(person_stats.size()):
		var stat = grid.get_child(2*i + 1)
		stat.set_value(person_stats[i])

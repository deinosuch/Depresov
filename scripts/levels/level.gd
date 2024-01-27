extends Control

class_name level

var level_data: LevelData
var current_person
var person_sprite
var stats

func _show_person(person : Person):
	# Centre person
	var screen_size = get_viewport_rect().size
	var center_position = Vector2(screen_size.x / 2, screen_size.y / 2)
	person_sprite.position = center_position
	
	# Set persons size
	person_sprite.texture = person.sprite
	var desired_width = screen_size.x / 5
	var original_width = person.sprite.get_width()
	var scale_factor = desired_width / original_width
	person_sprite.scale.x = scale_factor
	person_sprite.scale.y = scale_factor

func _show_stats(person : Person):
	# Set up stats
	var stat_names = person.stat_names
	var stat_values = person.get_stats()
	for i in range(stat_names.size()):
		var label = Label.new()
		label.text = stat_names[i] + "      "
		var bar = ProgressBar.new()
		bar.custom_minimum_size = Vector2(100, 10)
		bar.value = stat_values[i]
		stats.add_child(label)
		stats.add_child(bar)

func _update_stats(person : Person):
	if person == null: return # idk man, it works now
	var person_stats = person.get_stats()
	for i in range(person_stats.size()):
		
		var stat = stats.get_child(2*i + 1)
		(stat as ProgressBar).value = person_stats[i]

# Called when the node enters the scene tree for the first time.
func _ready():
	level_data = get_node("/root/LevelData")
	level_data.level = self
	#person_sprite = $Person
	stats = $ItemList
	
	current_person = ($Queue as PersonQueue).next()
	#_show_person(current_person)
	_show_stats(current_person)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_button_pressed():
	current_person = ($Queue as PersonQueue).next()
	_update_stats(current_person)

extends Control

var first_person : Person = preload("res://People/jerome.tres")
var second_person : Person = preload("res://People/marenka.tres")
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
	for stat_name in person.stats.keys():
		var label = Label.new()
		label.text = stat_name + "      "
		var bar = ProgressBar.new()
		bar.custom_minimum_size = Vector2(100, 10)
		bar.value = person.stats[stat_name]
		stats.add_child(label)
		stats.add_child(bar)

func _update_stats(person : Person):
	var current_stat
	for stat_index in range(stats.get_child_count()):
		var stat = stats.get_child(stat_index)
		
		if stat is Label:
			current_stat = (stat as Label).text.strip_edges()
			continue
		
		(stat as ProgressBar).value = person.stats[current_stat]

# Called when the node enters the scene tree for the first time.
func _ready():
	person_sprite = $Person
	stats = $ItemList
	
	_show_person(first_person)
	_show_stats(first_person)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_timer_timeout():
	_show_person(second_person)
	_update_stats(second_person)

extends Control

var first_person : Person = preload("res://People/Jenicek.tres")
var person_sprite
var stats



# Called when the node enters the scene tree for the first time.
func _ready():
	person_sprite = $Person
	stats = $ItemList
	
	# Centre person
	var screen_size = get_viewport_rect().size
	var center_position = Vector2(screen_size.x / 2, screen_size.y / 2)
	person_sprite.position = center_position
	
	# Set persons size
	person_sprite.texture = first_person.sprite
	var desired_width = screen_size.x / 5
	var original_width = first_person.sprite.get_width()
	var scale_factor = desired_width / original_width
	person_sprite.scale.x = scale_factor
	person_sprite.scale.y = scale_factor
	
	# Set up stats
	for stat_name in first_person.stats.keys():
		var label = Label.new()
		label.text = stat_name + "      "
		var bar = ProgressBar.new()
		bar.custom_minimum_size = Vector2(100, 10)
		bar.value = first_person.stats[stat_name]
		stats.add_child(label)
		stats.add_child(bar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

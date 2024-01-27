extends Control

class_name level

var current_person
var queue : PersonQueue
var stats
# constants, span a to b
const a = 5
const b = 15
var rng

@onready var game = get_node("/root/GameData") 

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

func _update_stats():
	if current_person == null: return # idk man, it works now
	var person_stats = current_person.get_stats()
	
	for i in range(person_stats.size()):
		var stat = stats.get_child(2*i + 1)
		(stat as ProgressBar).value = person_stats[i]

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	game.current_level = self
	#person_sprite = $Person
	stats = $ItemList
	queue = $Queue as PersonQueue
	current_person = queue.next()
	current_person.update_last_val()
	_show_stats(current_person)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_stat_dec():
	var dec = [0,0,0,0,0]	
	for i in range(len(dec)):
		dec[i] = -rng.randf_range(a,b)
	return dec
		
func _on_button_pressed():
	# Call update functions for metrics after person has been dealt with
	var metrics = current_person.get_metrics()
	game.update_metrics(metrics[0], metrics[1])
	#     decrease stats for next round
	current_person.add_array_to_stats(get_stat_dec())
	# load next person
	current_person = queue.next()
	if(current_person == null):
		return
	current_person.update_last_val()
	_update_stats()

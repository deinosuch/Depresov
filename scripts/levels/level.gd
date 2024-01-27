extends Control

class_name level

var current_person
var queue : PersonQueue
var stats
var rng
# constants, span a to b
const a = 5
const b = 15

@onready var game = get_node("/root/GameData") 

@onready var stat_bar = $StatBar

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	game.current_level = self
	#person_sprite = $Person
	stats = $ItemList
	queue = $Queue as PersonQueue
	current_person = queue.next()
	if game.first_rodeo:
		current_person.reset_to_default()
		current_person.add_array_to_stats(get_random_stat_in_span())
	current_person.update_last_val()
	stat_bar.initialize()
	#_show_stats(current_person)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_random_stat_in_span():
	var stat = [0,0,0,0,0]
	for i in range(len(stat)):
		stat[i] = rng.randf_range(a,b)
	return stat

func get_stat_dec():
	var dec = get_random_stat_in_span()
	for i in range(len(dec)):
		dec[i] *= -1
	return dec

func _on_button_pressed():
	# Call update functions for metrics after person has been dealt with
	var metrics = current_person.get_metrics()
	game.update_metrics(metrics[0], metrics[1])
	game.bar.update()
	#     decrease stats for next round
	current_person.add_array_to_stats(get_stat_dec())
	# load next person
	current_person = queue.next()
	if(current_person == null):
		game.first_rodeo = false
		return
	if game.first_rodeo:
		current_person.reset_to_default()
		current_person.add_array_to_stats(get_random_stat_in_span())
	
	current_person.update_last_val()
	stat_bar.update()

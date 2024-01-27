extends Control

class_name level

var current_person
var queue : PersonQueue
var stats
@onready var game = get_node("/root/GameData") 

@onready var stat_bar = $StatBar

# Called when the node enters the scene tree for the first time.
func _ready():
	
	game.current_level = self
	#person_sprite = $Person
	stats = $ItemList
	queue = $Queue as PersonQueue
	current_person = queue.next()
	current_person.update_last_val()
	stat_bar.initialize()
	#_show_stats(current_person)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	# Call update functions for metrics after person has been dealt with
	var metrics = current_person.get_metrics()
	game.update_metrics(metrics[0], metrics[1])
	# load next person
	current_person = queue.next()
	if(current_person == null):
		return
	current_person.update_last_val()
	stat_bar.update()

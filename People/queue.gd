extends Control

class_name PersonQueue

var queue : Array[Person]
var first_load = true

func next():
	if queue.size() == 0:
		_ready()
		#get_tree().quit() #For some reason not quitting??!
		#return null
	var person = queue.pop_back()
	$Person.texture = person.sprite
	return person

# Called when the node enters the scene tree for the first time.
func _ready():
	queue = []
	var directory_path : String = "res://People/ppl/"
	
	for filename in DirAccess.get_files_at(directory_path):
		var person = load(directory_path + filename)
		if first_load: person.reset_stats()
		queue.push_back(person)
	
	first_load = false
	queue.shuffle()

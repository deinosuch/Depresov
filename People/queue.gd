extends Control

class_name PersonQueue

var queue : Array[Person]

func next():
	if queue.size() == 0:
		get_tree().quit() #For some reason not quitting??!
		return null
	var person = queue.pop_back()
	$Person.texture = person.sprite
	return person

# Called when the node enters the scene tree for the first time.
func _ready():
	queue = []
	var directory_path : String = "res://People/ppl/"
	
	for filename in DirAccess.get_files_at(directory_path):
		queue.push_back(load(directory_path + filename))
	
	queue.shuffle()

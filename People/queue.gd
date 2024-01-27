extends Control

class_name PersonQueue

@export var queue : Array[Person]

func next():
	if(queue.size() == 0):
		get_tree().change_scene_to_file("res://scenes/shop.tscn")
		return
	var person = queue.pop_back()
	$Person.texture = person.sprite
	return person


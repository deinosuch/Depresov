extends Control

class_name PersonQueue

@export var queue : Array[Person]

func next():
	var person = queue.pop_back()
	$Person.texture = person.sprite
	return person


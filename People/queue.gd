extends Control

class_name PersonQueue

@export var queue : Array[Person]

func next():
	var person = queue.pop_front()
	$Person.texture = person.sprite
	return person


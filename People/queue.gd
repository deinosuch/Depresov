extends Control

class_name PersonQueue

@export var queue : Array[Person]
@onready var game: GameData = get_node("/root/GameData")

func next():
	if(queue.size() == 0):
		get_node("/root/GameData").goto("shop")
		return
	var person = queue.pop_back()
	$Person.texture = person.sprite
	return person

func new_queue():
	queue.clear()
	var people = game.people.duplicate()
	people.shuffle()
	for i in range(min(people.size(), game.current_day + 1)):
		queue.append(people[i])

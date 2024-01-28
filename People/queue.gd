extends Control

class_name PersonQueue

@export var queue : Array[Person]
@onready var game: GameData = get_node("/root/GameData")

func next():
	if(queue.size() == 0):
		game.goto("shop")
		return
	var person = queue.pop_back()
	$Person.texture = person.sprite
	return person

func new_queue():
	game.reset_served_count()
	queue.clear()
	var people = game.people.duplicate()
	people.shuffle()
	for i in range(game.get_people_count()):
		queue.append(people[i])

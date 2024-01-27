extends Resource

class_name HasStats

@export var happiness = 100
@export var energy = 100
@export var health = 100
@export var hunger = 100
@export var anxiety = 100

static var stat_names = ["Happiness", "Energy", "Health", "Hunger", "Anxiety"]

func get_stats():
	return [happiness, energy, health, hunger, anxiety]

func add_stats(object : HasStats):
	happiness = happiness + object.happiness
	energy = energy + object.energy
	health = health + object.health
	hunger = hunger + object.hunger
	anxiety = anxiety + object.anxiety

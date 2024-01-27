extends Resource

class_name HasStats

@export var mood = 100
@export var energy = 100
@export var health = 100
@export var focus = 100
@export var calmness = 100

static var stat_names = ["Mood", "Energy", "Health", "Focus", "Calmness"]

func get_stats():
	return [mood, energy, health, focus, calmness]

func add_stats(object : HasStats):
	mood = mood + object.mood
	energy = energy + object.energy
	health = health + object.health
	focus = focus + object.focus
	calmness = calmness + object.calmness

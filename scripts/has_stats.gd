extends Resource

class_name HasStats
const base_level = 0
@export var mood = base_level
@export var energy = base_level
@export var health = base_level
@export var focus = base_level
@export var calmness = base_level

static var stat_names = ["Mood", "Energy", "Health", "Focus", "Calmness"]

func get_stats():
	return [mood, energy, health, focus, calmness]

func add_stats(object : HasStats):
	mood = mood + object.mood
	energy = energy + object.energy
	health = health + object.health
	focus = focus + object.focus
	calmness = calmness + object.calmness

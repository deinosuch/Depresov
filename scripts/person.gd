extends HasStats

class_name Person

# Persons stats
@export var name : String = ""
@export var rights : bool = true
@export var sprite : Texture2D

func add_stats(object : HasStats):
	happiness = max(0, min(100, happiness + object.happiness))
	energy = max(0, min(100, energy + object.energy))
	health = max(0, min(100, health + object.health))
	hunger = max(0, min(100, hunger + object.hunger))
	anxiety = max(0, min(100, anxiety + object.anxiety))

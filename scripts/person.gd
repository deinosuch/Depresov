extends HasStats

class_name Person

# Persons stats
@export var name : String = ""
@export var rights : bool = true
@export var sprite : Texture2D
var last_values = [happiness, energy, health, hunger, anxiety]
@export var negative_penalty : float =  1.5# negative penalty multiplier

func update_last_val():
	last_values = [happiness, energy, health, hunger, anxiety]

func print_out_stat():
	print(happiness)
	print(energy)
	print(health)
	print(hunger)
	print(anxiety)

func add_stats(object : HasStats):
	happiness = max(0, min(100, happiness + object.happiness))
	energy = max(0, min(100, energy + object.energy))
	health = max(0, min(100, health + object.health))
	hunger = max(0, min(100, hunger + object.hunger))
	anxiety = max(0, min(100, anxiety + object.anxiety))
	#var diff = get_difference()
	#print(get_money_gain(diff))
	#print(get_happy_gain(diff))
	#update_last_val()
	ResourceSaver.save(self)

func get_money_gain(diff):
	var sum = 0
	for i in range(len(diff)):
		var am = diff[i]
		if diff[i] < 0: am *= negative_penalty
		sum += diff[i]
	return sum
	
func get_happy_gain(diff):
	var sum = 0
	for i in range(len(diff)):
		var am = diff[i] * (100 - last_values[i]) / 10
		if diff[i] < 0: am *= negative_penalty
		sum += am
	return sum

func get_difference():
	var diff = [happiness, energy, health, hunger, anxiety]
	for i in range(len(diff)):
		diff[i] -= last_values[i]
	return diff

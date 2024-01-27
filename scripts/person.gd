extends HasStats

class_name Person

# Persons stats
@export var name : String = ""
@export var rights : bool = true
@export var sprite : Texture2D
var last_values = [mood, energy, health, focus, calmness]
@export var negative_penalty : float =  1.5# negative penalty multiplier

func update_last_val():
	last_values = [mood, energy, health, focus, calmness]

func print_out_stat():
	print(mood)
	print(energy)
	print(health)
	print(focus)
	print(calmness)

func add_stats(object : HasStats):
	mood = max(0, min(100, mood + object.mood))
	energy = max(0, min(100, energy + object.energy))
	health = max(0, min(100, health + object.health))
	focus = max(0, min(100, focus + object.focus))
	calmness = max(0, min(100, calmness + object.calmness))
	#var diff = get_difference()
	#print(get_money_gain(diff))
	#print(get_happy_gain(diff))
	#update_last_val()
	ResourceSaver.save(self)

func get_metrics():
	var diff = get_difference()
	return [get_money_gain(diff), get_happy_gain(diff)]

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
	var diff = [mood, energy, health, focus, calmness]
	for i in range(len(diff)):
		diff[i] -= last_values[i]
	return diff

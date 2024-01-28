extends HasStats

class_name Person

# Persons stats
@export var name : String = ""
@export var rights : bool = true
@export var sprite : Texture2D


const negative_penalty : float =  1.5 #negative penalty multiplier
const default_vals = [50,50,50,50,50]
var last_values = [mood, energy, health, focus, calmness]

func update_last_val():
	last_values = [mood, energy, health, focus, calmness]

func print_out_stat():
	print(mood)
	print(energy)
	print(health)
	print(focus)
	print(calmness)
	
func is_dead():
	return mood <= 0 or energy <= 0 or health <= 0 or focus <= 0 or calmness <= 0

func add_stats(object : HasStats):
	mood = max(0, min(100, mood + object.mood))
	energy = max(0, min(100, energy + object.energy))
	health = max(0, min(100, health + object.health))
	focus = max(0, min(100, focus + object.focus))
	calmness = max(0, min(100, calmness + object.calmness))

func get_metrics():
	var diff = get_difference()
	return [get_money_gain(diff), get_happy_gain(diff)]

func get_money_gain(diff):
	var sum = 0
	for i in range(len(diff)):
		var am = diff[i]
		if diff[i] < 0: am *= negative_penalty
		sum += diff[i]
	return int(sum)
	
func get_happy_gain(diff):
	var sum = 0
	for i in range(len(diff)):
		var am = diff[i] * (100 - last_values[i]) / 10
		if diff[i] < 0: am *= negative_penalty
		sum += am
	return int(sum)

func get_difference():
	var diff = [mood, energy, health, focus, calmness]
	for i in range(len(diff)):
		diff[i] -= last_values[i]
	return diff
	
func reset_to_default():
	set_array_to_stats(default_vals)
	
func set_array_to_stats(vals):
	mood = max(0, min(100, vals[0]))
	energy = max(0, min(100, vals[1]))
	health = max(0, min(100, vals[2]))
	focus = max(0, min(100, vals[3]))
	calmness = max(0, min(100, vals[4]))
	
func add_array_to_stats(vals):
	mood = max(0, min(100, mood + vals[0]))
	energy = max(0, min(100, energy + vals[1]))
	health = max(0, min(100, health + vals[2]))
	focus = max(0, min(100, focus + vals[3]))
	calmness = max(0, min(100, calmness + vals[4]))

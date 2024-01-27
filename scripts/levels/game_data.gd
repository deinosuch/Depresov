extends Node

var current_level: level
var inventory: Inventory = null
var first_rodeo = true
var bar
# metrics
var money = 1000
var global_happiness = 5000
var current_day = 1

func update_metrics(mon, hap):
	money += mon
	global_happiness += hap
	print(money)
	print(global_happiness)

func increase_day_count():
	current_day += 1

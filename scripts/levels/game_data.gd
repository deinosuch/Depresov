extends Node

var current_level: level
var inventory: Inventory = null
var money = 100
var global_happiness = 5000

func update_metrics(mon, hap):
	money += mon
	global_happiness += hap
	print(money)
	print(global_happiness)

extends Node

var current_level: level
var inventory: Inventory = null
var bar
# metrics
var money = 200
var global_happiness = 1000
var max_global_happiness
var current_day = 0
var people: Array[Person]
var already_served = 0

@onready var rng = RandomNumberGenerator.new()

func get_people_count():
	return min(people.size(), current_day + 1)
	
func reset_served_count():
	already_served = 0
	
func get_people_left():
	return get_people_count() - already_served
	
func _ready():
	load_assets()
		
func load_assets():
	load_people()
	
func load_people():
	var dirname = "res://People/ppl/" 
	var files = DirAccess.get_files_at(dirname)
	for file in files:
		var person = load(dirname + file)
		people.append(person)
		reset_person(person) 
	
func reset_person(person: Person):
	person.reset_to_default()
	person.add_array_to_stats(get_random_stat_in_span(-15, 15))
	
func get_random_stat_in_span(a, b):
	var stat = [0,0,0,0,0]
	for i in range(len(stat)):
		stat[i] = rng.randf_range(a,b)
	return stat

func get_stat_dec():
	var dec = get_random_stat_in_span(5, 15)
	for i in range(len(dec)):
		dec[i] *= -1
	return dec

func update_metrics(mon, hap):
	money += mon
	global_happiness = min(global_happiness + hap, max_global_happiness)
	
func choose_tv_texture(textures: Array[Texture]) -> Texture:
	var interval_size = max_global_happiness / textures.size()
	var i = max(0, min(floor(global_happiness / interval_size), textures.size() - 1))
	return textures[i]
	
func check_lose():
	if global_happiness <= 0:
		return true
	
	for person in people:
		if person.is_dead():
			return true
	
	return false
	
func check_win():
	if global_happiness >= max_global_happiness:
		return true
		
	return false
		
func end_condition():
	if check_lose():
		return goto("lose")
	
	if check_win():
		return goto("win")
	
func build_queue():
	current_level.queue.new_queue()
	
func goto(where):
	if where == "shop":
		get_tree().change_scene_to_file("res://scenes/shop.tscn")
	elif where == "level":
		get_tree().change_scene_to_file("res://scenes/levels/level.tscn")
	elif where == "win":
		print("WIN")
	elif where == "lose":
		print("LOSE")

func next_day():
	current_day += 1
	goto("level")

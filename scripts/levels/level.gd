extends Control

class_name level

var current_person
@onready var queue : PersonQueue = $Queue
var stats
var rng
# constants, span a to b
const a = 5
const b = 15

@onready var game: GameData = get_node("/root/GameData") 

@onready var stat_bar = $StatBar
@onready var tv = $TV

@export var tv_faces: Array[Texture]

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	game.current_level = self
	game.build_queue()
	#person_sprite = $Person
	current_person = queue.next()
	current_person.update_last_val()
	stat_bar.initialize()
	game.bar.update()
	
	tv.texture = game.choose_tv_texture(tv_faces)

func _on_button_pressed():
	# Call update functions for metrics after person has been dealt with
	var metrics = current_person.get_metrics()
	game.update_metrics(metrics[0], metrics[1])
	tv.texture = game.choose_tv_texture(tv_faces)
	game.already_served += 1
	game.bar.update()
	#     decrease stats for next round
	current_person.add_array_to_stats(game.get_stat_dec())
	# load next person
	current_person = queue.next()
	if !current_person:
		return
	
	current_person.update_last_val()
	stat_bar.update()
	
	game.end_condition()

func _unhandled_key_input(event):
	if event.pressed and event.keycode == KEY_ESCAPE:
		$Pause.show()

func unpause():
	$Pause.hide()

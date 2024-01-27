extends Control

@onready var total_price_label : Label = $Label
@onready var game_state = get_node("/root/GameData")

var total_price : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var directory_path : String = "res://resources/items/"
	total_price_label.text = str(total_price)
	
	var i = 0
	for filename in DirAccess.get_files_at(directory_path):
		var item = load(directory_path + filename)
		$Panel/GridContainer.get_child(i).initialize(item)
		i+=1
		if(i == 16):
			break

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if total_price > game_state.money:
		return
	game_state.money -= total_price
	total_price = 0
	get_tree().change_scene_to_file("res://scenes/levels/level.tscn")

func add_to_total(amount : int):
	total_price += amount
	total_price_label.text = str(total_price)

extends Control

@onready var game_data = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():
	if not game_data.bar:
		game_data.bar = self
		update()

func update():
	$NinePatchRect/TextureProgressBar.value = game_data.global_happiness
	$NinePatchRect/Label.text = str(game_data.money)
	$NinePatchRect/Label2.text = "day #" + str(game_data.current_day)

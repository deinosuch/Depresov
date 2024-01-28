extends Control

@onready var game_data: GameData = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():
	game_data.max_global_happiness = $NinePatchRect/TextureProgressBar.max_value
	
	if not game_data.bar:
		game_data.bar = self
		update()

func update():
	$NinePatchRect/TextureProgressBar.value = game_data.global_happiness
	$NinePatchRect/Label.text = str(game_data.money)
	$NinePatchRect/Label2.text = "day #" + str(game_data.current_day)

func format_money(amount):
	var text = ""
	if amount < 0:
		text = "- "
	text = text + str(abs(amount))
	print(text)
	return text

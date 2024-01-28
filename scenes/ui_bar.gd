extends Control

@onready var game_data = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():
	if not game_data.bar:
		game_data.bar = self
		update()

func update():
	$NinePatchRect/TextureProgressBar.value = game_data.global_happiness
	$NinePatchRect/MoneyCounter.text = str(game_data.money)
	$NinePatchRect/DayCounter.text = "day #" + str(game_data.current_day)
	if game_data.get_people_left() == 0:
		$NinePatchRect/PersonCounter.hide()
		$NinePatchRect/PersonIcon.hide()
	else:
		$NinePatchRect/PersonCounter.show()
		$NinePatchRect/PersonIcon.show()
	$NinePatchRect/PersonCounter.text = str(game_data.get_people_left())

extends Control

@onready var game_data = get_node("/root/GameData")

# Called when the node enters the scene tree for the first time.
func _ready():
	$NinePatchRect/TextureProgressBar.value = game_data.global_happiness
	$NinePatchRect/Label.text = str(game_data.money)

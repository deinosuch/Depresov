extends Control

@onready var game: GameData = get_node("/root/GameData")
@onready var inventory: Inventory = preload("res://resources/inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

# Called when the node enters the scene tree for the first time.
func _ready():
	if game.inventory:
		inventory = game.inventory
	else:
		game.inventory = inventory
		
	update_slots()
	
func update_slots():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].initialize(inventory.items[i])


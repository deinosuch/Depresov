extends Control

@onready var inventory: Inventory = preload("res://resources/inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

# Called when the node enters the scene tree for the first time.
func _ready():
	update_slots()
	
func update_slots():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].slot = inventory.items[i]
		slots[i].update()


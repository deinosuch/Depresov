extends Resource


class_name Inventory

@export var items: Array[Slot]

func add(item : Item, amount : int):
	for slut in items:
		if slut.item == item:
			slut.amount += amount
			break

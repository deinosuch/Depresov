extends Resource


class_name Slot

@export var item: Item
@export var amount: int = 0

func is_empty():
	return amount <= 0

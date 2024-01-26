extends Panel

@onready var sprite: Sprite2D = $Sprite2D

func update(slot: Slot):
	if !slot or slot.amount <= 0:
		sprite.visible = false
	else:
		sprite.visible = true
		sprite.texture = slot.item.texture

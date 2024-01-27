extends Panel

@onready var texture: TextureRect = $CenterContainer/TextureRect
	

func update(slot: Slot):
	if !slot or slot.amount <= 0:
		texture.visible = false
	else:
		texture.visible = true
		texture.texture = slot.item.texture

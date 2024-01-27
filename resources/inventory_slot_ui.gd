extends Panel

@onready var texture: TextureRect = $CenterContainer/TextureRect
@onready var count: Label = $Panel/Count

func update(slot: Slot):
	if !slot or slot.amount <= 0:
		visible = false
	else:
		visible = true
		texture.texture = slot.item.texture
		count.text = str(slot.amount)

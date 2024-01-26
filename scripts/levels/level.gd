extends Control

var first_person : Person = preload("res://People/Jenicek.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	var person_sprite = $Sprite2D
	person_sprite.position = Vector2(100, 200)
	person_sprite.texture = first_person.sprite
	
	var desired_width = 200.0
	
	var original_width = first_person.sprite.get_width()
	var scale_factor = desired_width / original_width
	
	person_sprite.scale.x = scale_factor
	person_sprite.scale.y = scale_factor
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends GridContainer

@onready var game = get_node("/root/GameData") 
var money_label
var happy_label

# Called when the node enters the scene tree for the first time.
func _ready():
	money_label = Label.new()
	happy_label = Label.new()
	add_child(money_label)
	add_child(happy_label)
	money_label.text = str(game.money)
	happy_label.text = str(game.global_happiness)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	money_label.text = str(game.money)	
	happy_label.text = str(game.global_happiness)	
	pass

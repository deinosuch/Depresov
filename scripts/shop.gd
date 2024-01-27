extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var directory_path : String = "res://resources/items/"
	
	for filename in DirAccess.get_files_at(directory_path):
		var item = load(directory_path + filename)
		var shop_item = ShopItem.new(item)
		$NinePatchRect/GridContainer.add_child(shop_item)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

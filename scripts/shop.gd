extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var directory_path : String = "res://resources/items/"
	
	var i = 0
	for filename in DirAccess.get_files_at(directory_path):
		var item = load(directory_path + filename)
		$Panel/GridContainer.get_child(i).initialize(item)
		i+=1
		if(i == 15):
			break

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

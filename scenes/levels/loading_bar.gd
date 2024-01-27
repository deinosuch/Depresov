extends Node2D


var progress_bar: TextureProgressBar = get_child(0)

func set_value(value: int):
	progress_bar.value = value

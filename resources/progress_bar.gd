extends Control


@onready var progress_bar: TextureProgressBar = $NinePatchRect/TextureProgressBar

func set_value(value: int):
	progress_bar.value = value

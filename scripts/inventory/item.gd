extends HasStats


class_name Item

@export var name: String = ""
@export var texture: Texture2D

func use(person: Person):
	person.add_stats(self)

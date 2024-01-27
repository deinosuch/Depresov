extends HasStats


class_name Item

@export var name: String = ""
@export var texture: Texture2D
@export var price = 10

func use(person: Person):
	person.add_stats(self)

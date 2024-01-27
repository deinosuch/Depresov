extends Resource

class_name Person

# Persons stats
@export var name : String = ""
@export var rights : bool = true
@export var stats = {
	"happiness" : 100,
	"energy" : 100,
	"health" : 100, 
	"hunger" : 100,
	"anxiety" : 100
}
@export var sprite : Texture2D

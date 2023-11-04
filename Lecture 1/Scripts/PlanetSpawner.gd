extends Node

@export var planetObject: PackedScene
@export var planetPlethora: int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, planetPlethora):
		var instance = planetObject.instantiate()
		add_child(instance)
		


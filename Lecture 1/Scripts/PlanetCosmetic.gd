extends Node

@export var rotateSpeed: float = 5
@export var availablePlanets:Array[CompressedTexture2D]

var sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite2D = $Planet_Sprite
	var randTexture = availablePlanets[randi() % availablePlanets.size()]
	sprite2D.set_texture(randTexture)
	var randPosition = Vector2(randi() % 800, randi() % 700)
	var randomScale = randf_range(0.01, 0.2)
	var randScale = Vector2(1, 1) * randomScale
	print(str(randScale))
	self.position = randPosition
	self.scale = randScale
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotation += rotateSpeed * delta
	

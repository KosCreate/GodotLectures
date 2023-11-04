extends Area2D

enum AnimationState { idle, moving }

@export var spriteSize:Vector2 = Vector2(80, 80)
@export var movementSpeed: float = 10

var animated_sprite: AnimatedSprite2D

var s_width = ProjectSettings.get("display/window/size/width")
var s_height = ProjectSettings.get("display/window/size/height")

var screenRatio = DisplayServer.window_get_size()

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite = $AnimatedSprite2D
	animated_sprite.play("bird_fly")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var horizontalMove = Input.get_axis("horizontal_move_neg", "horizontal_move_pos")
	var verticalMove = -Input.get_axis("vertical_move_neg", "vertical_move_pos")
	
	var movement = Vector2(horizontalMove * delta * movementSpeed, verticalMove * delta * movementSpeed)
	animated_sprite.flip_h = horizontalMove > 0 
	
	self.position += movement
	
	self.position.x = clamp(self.position.x, spriteSize.x, screenRatio.x - spriteSize.x)
	self.position.y = clamp(self.position.y, spriteSize.y, screenRatio.y - spriteSize.y)
	self.position.normalized()

extends CharacterBody2D

var speed = 800
const START_POSITION = Vector2(640,940)

func _ready():
	position = START_POSITION

func _physics_process(delta):
	if Globals.game_start:
		var direction = Input.get_axis("Left","Right")
		velocity.x = direction * speed
		move_and_collide(velocity * delta)
	
	if Globals.game_stop:
		position = START_POSITION

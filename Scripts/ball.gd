extends CharacterBody2D


const DEFAULT_SPEED = 600
var speed = DEFAULT_SPEED
var i = 0 
const START_POSITION = Vector2(640,670)

func _ready():
	Globals.game_status_change.connect(start_ball)
	Globals.game_stop_change.connect(stop_ball)
	position = START_POSITION	

func _physics_process(delta):
	if Globals.game_start:	
		var collision_object = move_and_collide(velocity * speed * delta)
		if collision_object:
			var object = collision_object.get_collider()
			if object is Brick:
				hit_brick(object)
			reflect_ball(collision_object)
		
func start_ball():
	speed = DEFAULT_SPEED
	random_velocity()
	
func reflect_ball(collision_object):
	var reflect = collision_object.get_remainder().bounce(collision_object.get_normal())
	velocity = velocity.bounce(collision_object.get_normal())	
	move_and_collide(reflect)

func hit_brick(object):
	object.queue_free()
	speed += 5
	Globals.player_score += 100
	
func stop_ball():
	speed = 0

func reset_ball():
	stop_ball()
	position = START_POSITION
	if !Globals.game_stop:
		$Timer.start()

func random_velocity():
	randomize()
	velocity.x = [-1,1][randi() % 2] 
	velocity.y = -1


func _on_timer_timeout():
	start_ball()
	pass # Replace with function body.

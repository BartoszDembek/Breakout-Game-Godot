extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Ball.stop_ball()
	$BrickSpawner.reset_ball.connect($Ball.reset_ball)
 	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()

	if Input.is_action_just_pressed("Start") && !Globals.game_start:
		if !Globals.game_start:
			Globals.player_life = 3
			Globals.player_score = 0
			Globals.game_start = true
		if Globals.game_stop:
			Globals.game_stop = false

func _on_reset_area_body_entered(_body):
	Globals.player_life -= 1
	if Globals.player_life <= 0:
		Globals.game_start = false
		Globals.game_stop = true
		
	$Ball.reset_ball()

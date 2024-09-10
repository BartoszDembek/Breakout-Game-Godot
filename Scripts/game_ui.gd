extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.game_status_change.connect(startGame)
	Globals.score_change.connect(updateScore)
	Globals.life_change.connect(updateLife)
	Globals.game_stop_change.connect(stopGame)
	$MarginContainer/VBoxContainer.visible = false
	$MarginContainer3/VBoxContainer/GameLabel.visible = true
	$MarginContainer3/VBoxContainer/GameLabel.text = "BreakOut"
	$MarginContainer3/VBoxContainer/BestScore.visible = false
	$MarginContainer2/VBoxContainer2/GameOptionLabel.visible = true
	$MarginContainer2/VBoxContainer2/GameOptionLabel.text = "Press Space To Start"
	updateScore()
	updateLife()

func startGame():
	$MarginContainer/VBoxContainer.visible = true
	$MarginContainer3/VBoxContainer/GameLabel.visible = false
	$MarginContainer2/VBoxContainer2/GameOptionLabel.visible = false
	$MarginContainer2/VBoxContainer2/QuitOptionLabel.visible = false
	$MarginContainer3/VBoxContainer/BestScore.visible = false

func updateScore():
	$MarginContainer/VBoxContainer/Score.text = "Score: " + str(Globals.player_score)

func updateLife():
	$MarginContainer/VBoxContainer/Label.text = "Life: " + str(Globals.player_life)

func stopGame():
	if Globals.game_stop:
		$MarginContainer3/VBoxContainer/GameLabel.text = "You Lose"
		$MarginContainer3/VBoxContainer/GameLabel.visible = true 
		$MarginContainer3/VBoxContainer/BestScore.visible = true
		$MarginContainer3/VBoxContainer/BestScore.text = "Best Score: " + str(Globals.best_score)
		$MarginContainer2/VBoxContainer2/GameOptionLabel.visible = true
		$MarginContainer2/VBoxContainer2/GameOptionLabel.text = "Press Space To Reset"
		$MarginContainer2/VBoxContainer2/QuitOptionLabel.visible = true
	else:
		$MarginContainer3/VBoxContainer/GameLabel.visible = false
		$MarginContainer2/VBoxContainer2/GameOptionLabel.visible = false
		$MarginContainer2/VBoxContainer2/QuitOptionLabel.visible = false
		$MarginContainer3/VBoxContainer/BestScore.visible = false

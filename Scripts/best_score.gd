extends Node


func _ready():
	load_best_score()
	Globals.best_score_change.connect(save_score)
	
func save_score():
	var cfgFile = ConfigFile.new()
	cfgFile.set_value("Best Score","best_score",Globals.best_score)
	cfgFile.save("user://save.cfg")
	
	
func load_best_score():
	var cfgFile = ConfigFile.new()
	var err = cfgFile.load("user://save.cfg")
	if err != OK:
		Globals.best_score = 0
		return
		
	Globals.best_score = cfgFile.get_value("Best Score","best_score")

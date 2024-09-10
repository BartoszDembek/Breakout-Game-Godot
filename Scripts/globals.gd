extends Node

signal score_change
signal life_change
signal game_status_change
signal game_stop_change
signal best_score_change

var player_score = 0:
	set(value):
		player_score = value
		if player_score >= best_score:
			best_score = player_score
		score_change.emit()

var best_score = 0:
	set(value):
		best_score = value
		best_score_change.emit()
		
var player_life = 3:
	set(value):
		player_life = value
		life_change.emit()

var game_start = false:
	set(value):
		game_start = value
		game_status_change.emit()
	
var game_stop = false:
	set(value):
		game_stop = value
		if game_stop:
			game_stop_change.emit()

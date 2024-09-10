extends Node2D

@onready var brick_scene = preload("res://Scenes/brick.tscn")
var color_array = ["#FFC0CB","#FF0000","#FFA500","#FFFF00","#008000","#0000FF","#A020F0","#00FFFF"]
signal reset_ball

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.game_stop_change.connect(delete_brick)
	spawn_bricks()

func _process(_delta):
	if Globals.game_start:
		check_empty_spawner()

func check_empty_spawner():
	if get_child_count() == 0:
		reset_ball.emit()
		spawn_bricks()

func delete_brick():
	if Globals.game_stop:
		for _i in self.get_children():
			_i.queue_free()
		
		spawn_bricks()

func spawn_bricks():
	for i in range(0,8):
		for j in range(0,16):
			var brick = brick_scene.instantiate()
			brick.position.x = j * 80
			brick.position.y = i * 42
			brick.get_node("TextureRect").modulate = color_array[i]
			call_deferred("add_child",brick)
	

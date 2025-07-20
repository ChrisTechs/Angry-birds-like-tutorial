extends Node2D

signal reset_bird

var level_counter:int = 1
const MAX_LEVEL = 3

func _ready():
	load_level(level_counter)

func load_level(level_number:int):
	reset_bird.emit()
	
	var new_level = load("res://levels/level_"+str(level_number)+".tscn").instantiate()
	new_level.won.connect(level_won)
	add_child(new_level)

func level_won():
	level_counter += 1
	
	if level_counter <= MAX_LEVEL:
		load_level(level_counter)

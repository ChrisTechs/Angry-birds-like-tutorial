extends Node

signal won

var num_enemies:int = 0

func _ready():
	child_exiting_tree.connect(_on_child_exiting_tree)
	
	for child in get_children():
		if child.is_in_group("enemy"):
			num_enemies += 1

func _on_child_exiting_tree(node):
	if node.is_in_group("enemy"):
		num_enemies -= 1
		
		if num_enemies <= 0:
			won.emit()
			queue_free()

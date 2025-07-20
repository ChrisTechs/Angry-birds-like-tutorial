extends Sprite2D

var target:RigidBody2D = null

@onready var left_line = $left_line
@onready var right_line = $right_line

func _process(delta):
	
	if target == null:
		left_line.hide()
		right_line.hide()
	else:
		left_line.show()
		right_line.show()
		left_line.set_point_position(1,left_line.to_local(target.position)+Vector2(-22,0))
		right_line.set_point_position(1,right_line.to_local(target.position)+Vector2(22,0))
	

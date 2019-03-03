extends Area2D
class_name Character

export var speed = 250 
export var turn_speed = 50

var dir = Vector2(0,0)
var vel = Vector2(0,0)

func _process(delta):
	set_movement_dir()
	_update_vel()
	_update_pos(delta)
	_face_movement(delta)
	pass

func set_movement_dir():
	
	pass

func _update_vel():
	vel = dir * speed
	pass

func _update_pos(delta):
	position += vel*delta
	pass

func _face_movement(delta):
	var angle = atan2(dir.y,dir.x)+PI/2
	rotation = lerp(rotation,angle,turn_speed * delta)
	pass
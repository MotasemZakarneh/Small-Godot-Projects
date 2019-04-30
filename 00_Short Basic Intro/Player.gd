extends KinematicBody2D
export var speed = 200
export var jump_power = -350
const floor_normal = Vector2(0,-1)
const gravity = 500

var vel = Vector2(0,0)
var dir = Vector2(0,0)

func _process(delta):
	_read_input()
	_update_x_vel()
	
	if not _jump():
		_apply_gravity(delta)
	print(is_on_floor())
	move_and_slide(vel,floor_normal)
	pass

func _read_input():
	dir = Vector2(0,0)
	if Input.is_action_pressed("ui_left"):
		dir.x = -1
	elif Input.is_action_pressed("ui_right"):
		dir.x = 1
	pass

func _update_x_vel():
	vel.x = dir.x * speed
	pass

func _jump():
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		vel.y = jump_power
		return true
	return false

func _apply_gravity(delta):
	vel.y = vel.y + gravity * delta
	if is_on_floor():
		vel.y=1
	pass
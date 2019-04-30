extends KinematicBody2D

export var movement_speed = 350
export var jump_speed = 200
export var gravity = 500

var dir = Vector2(0,0)
var vel = Vector2(0,0)
var current_animatin = ""

func _process(delta):
	_read_input_x()
	if not _jump():
		_fall(delta)
	_apply_vel()
	_animate()
	_set_facing_direction()
	pass

func _read_input_x():
	
	dir.x = 0
	if Input.is_action_pressed("right"):
		dir.x = 1
	if Input.is_action_pressed("left"):
		dir.x = -1
	
	vel.x = dir.x * movement_speed
	pass

func _jump():
	if is_on_floor() and Input.is_action_pressed("jump"):
		vel.y = -1*jump_speed
		return true
	
	return false

func _fall(time):
	# velocity = acceleration * time 
	if not is_on_floor():
		vel.y = vel.y + gravity * time
	else:
		vel.y = 10
	pass

func _apply_vel():
	move_and_slide(vel,Vector2.UP)
	pass

func _animate():
	var animator = get_node("AnimationPlayer")
	var new_animation = ""
	
	if is_on_floor():
		if vel.x == 0:
			new_animation = "Idle"
		else:
			new_animation = "Run"
	else:
		new_animation = "Jump"
	
	if new_animation != current_animatin and new_animation != "":
		animator.play(new_animation)
		current_animatin = new_animation
	pass

func _set_facing_direction():
	var sprite = get_node("Sprite")
	if vel.x<0:
		sprite.flip_h = true
	elif vel.x>0:
		sprite.flip_h = false
	pass
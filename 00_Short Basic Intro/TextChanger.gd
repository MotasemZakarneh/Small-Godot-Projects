extends Label
export var the_words = "I have been changed through code"
export var mid_game_words = "I Am In Middle Of Game"

func _ready():
	text = the_words
	pass

func _process(delta):
	if Input.is_key_pressed(KEY_A):
		text = mid_game_words
	pass
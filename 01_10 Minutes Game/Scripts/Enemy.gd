extends Character
export var min_speed = 150
export var max_speed = 350

var player
func _ready():
	randomize()
	speed = rand_range(min_speed,max_speed)
	player = get_tree().get_nodes_in_group("Player")[0]
	pass
func set_movement_dir():
	dir = (player.global_position - global_position).normalized()
	pass

func _on_Enemy_area_entered(area):
	if area.is_in_group("Player"):
		Level.restart_game()
	pass 
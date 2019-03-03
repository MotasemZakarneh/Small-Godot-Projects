extends Node

const load_level ="res://Scenes/LoadingScene.tscn"
const level ="res://Scenes/Level.tscn"

func restart_game():
	get_tree().change_scene(load_level)
	yield(get_tree(),"node_added")
	get_tree().change_scene(level)
	pass
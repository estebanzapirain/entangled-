extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_continuarBtn_pressed():
	get_tree().change_scene("world.tscn") #ir al world original
	#get_tree().change_scene("res://screen_split/game/split_screen.tscn") #ir a split_screen


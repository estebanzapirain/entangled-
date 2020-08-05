extends Node

onready var current_level = 1
onready var last_level = 1
onready var completed = {1:"No",2:"No",3:"No"}
onready var level_path = "res://level1.tscn"

#func _ready():
	#Saves.load_game()
	
func save_level_completed():
	Saves.save_game()

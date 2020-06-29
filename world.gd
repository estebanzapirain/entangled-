extends Node2D

#const levelResource = preload("res://level " + str(Autoload.level) + ".tscn")

func _ready():
	pass # Replace with function body.

func go_to_next_level():
	Autoload.level +=1
	print(Autoload.level)

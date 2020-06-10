extends Node2D

#const levelResource = preload("res://level " + str(Autoload.level) + ".tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func go_to_next_level():
	Autoload.level +=1
	print(Autoload.level)

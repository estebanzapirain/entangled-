extends Node2D

#const levelResource = preload("res://level " + str(Autoload.level) + ".tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var levelStr = "res://level" + str(Autoload.level) +".tscn"
	levelResource = preload(levelStr)
	var LevelInstance= levelResource.instance()
	self.add_child(LevelInstance)
	self.move_child(LevelInstance,0)
	pass # Replace with function body.

func go_to_next_level():
	Autoload.level +=1
	print("res://level" + str(Autoload.level) +".tscn")
	var LevelInstance= levelResource.instance()
	self.remove_child(LevelInstance)
	self.add_child(LevelInstance)
	self.move_child(LevelInstance,0)
	pass # Replace with function body.

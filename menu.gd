extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$aliceAnimPlayer.play("aliceWalk")
	$bobAnimPlayer.play("bobWalk")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	# $aliceAnimPlayer.play("aliceWalk")


func _on_nuevoBtn_pressed():
	get_tree().change_scene("intro.tscn")

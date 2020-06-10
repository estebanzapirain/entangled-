extends Node2D

onready var alice = get_parent().get_node("Alice")
onready var bob = get_parent().get_node("Bob")
onready var observer = get_node("Observer/KinematicBody2D")

func _ready():
	print(Autoload.level)
#	alice.position = Autoload.AliceStartPos[Autoload.level]
#	bob.position = Autoload.BobStartPos[Autoload.level]
	observer.connect("was_observed",self,"player_observed")

func player_observed(character):
	print(character,"was observed")
	#TODO: ir a una escena de muerte, y después recargar la escena
	get_tree().reload_current_scene()

func _on_Exit_body_entered(body):
	print("Alice Got to the Exit");
	get_parent().go_to_next_level()






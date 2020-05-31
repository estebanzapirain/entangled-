extends Node2D

const AliceStartPos = Vector2(52,-15)
const BobStartPos = Vector2(236,75)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var alice = get_parent().get_node("Alice")
onready var bob = get_parent().get_node("Bob")
onready var observer = get_node("Observer/KinematicBody2D")
onready var timer = get_parent().get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	alice.position = AliceStartPos
	bob.position = BobStartPos
	observer.connect("was_observed",self,"player_observed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func player_observed(character):
#	print(character,"was observed")
	if timer.is_stopped():
		timer.start()
		print(character,"was observed")


func _on_Timer_timeout():
	get_tree().reload_current_scene()
#	alice.position = AliceStartPos
#	bob.position = BobStartPos


func _on_Exit_body_entered(body):
	print("Salida");






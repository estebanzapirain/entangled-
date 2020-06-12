extends Node2D

onready var alice = get_parent().get_node("Alice")
onready var bob = get_parent().get_node("Bob")
onready var alice_script = get_parent().get_node("Alice/KinematicBody2D")
onready var bob_script = get_parent().get_node("Bob/KinematicBody2D")
onready var observer = get_node("Enemies/Observer/KinematicBody2D")
onready var observer2 = get_node("Enemies/Observer2/KinematicBody2D")
onready var timer = get_node("Timer")
#onready var time_label = get_node("time")
onready var time_label = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("CanvasLayer/time")

func _ready():
#	alice.position = Autoload.AliceStartPos[Autoload.level]
#	bob.position = Autoload.BobStartPos[Autoload.level]
	observer.connect("was_observed",self,"player_observed")
	observer2.connect("was_observed",self,"player_observed")
	
func _process(delta):
	time_label.text = "Time Left: "+str(stepify(timer.time_left,0.1))+" secs"
	
func player_observed(character):
	print(character," was observed")
	players_stop()
	#TODO: ir a una escena de muerte, y después recargar la escena
	get_tree().reload_current_scene()

func _on_Exit_body_entered(body):
	print(body.get_owner().name," Got to the Exit");
	get_parent().go_to_next_level()

func _on_Timer_timeout():
	print("Time Out")
	#TODO: ir a una escena de muerte, y después recargar la escena
	get_tree().reload_current_scene()

func players_stop():
	Input.action_release("right1");
	Input.action_release("left1");
	Input.action_release("up1");
	Input.action_release("down1");
	Input.action_release("right2");
	Input.action_release("left2");
	Input.action_release("up2");
	Input.action_release("down2");
	

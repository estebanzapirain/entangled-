extends Node2D

onready var alice = get_node("Alice")
onready var bob = get_node("Bob")
onready var alice_script = get_node("Alice/KinematicBody2D")
onready var bob_script = get_node("Bob/KinematicBody2D")
onready var timer = get_node("Timer")
#onready var time_label = get_node("time")
onready var time_label = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("CanvasLayer/time")

func _ready():
	pass	
func _process(delta):
	time_label.text = "Time until Decoherence: "+str(stepify(timer.time_left,0.1))+" msecs"
	pass
	
#Un personaje fue observado
func player_observed(character):
	Autoload.message = character + " was observed"
	get_tree().change_scene("ad_screen.tscn")
	players_stop() #se frenan los personajes. Esto es para los controles touch
	#TODO: ir a una escena de muerte, y después recargar la escena


#Un personaje cruzó la salida
func _on_Exit_body_entered(body):
	#if (Metricas.current_level > Metricas.last_level):
	Metricas.last_level = Metricas.current_level;
	Metricas.completed[Metricas.current_level]=body.get_owner().name
	Autoload.message = body.get_owner().name + " Got to the Exit"
	get_tree().change_scene("ad_screen.tscn")
	players_stop() #se frenan los personajes. Esto es para los controles touch

#Se terminó el tiempo
func _on_Timer_timeout():
	Autoload.message = "Coherence Time is over! Quantum system is collapsed"
	get_tree().change_scene("ad_screen.tscn")
	players_stop() #se frenan los personajes. Esto es para los controles touch

func players_stop():
	Input.action_release("right1");
	Input.action_release("left1");
	Input.action_release("up1");
	Input.action_release("down1");
	Input.action_release("right2");
	Input.action_release("left2");
	Input.action_release("up2");
	Input.action_release("down2");
	

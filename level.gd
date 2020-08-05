extends Node2D

onready var alice = get_node("Alice")
onready var bob = get_node("Bob")
onready var alice_script = get_node("Alice/KinematicBody2D")
onready var bob_script = get_node("Bob/KinematicBody2D")
onready var timer = get_node("Timer")
#onready var time_label = get_node("time")
onready var time_label = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("CanvasLayer/time")
onready var observer = get_node("Enemies/Observer/KinematicBody2D")
onready var observer2 = get_node("Enemies/Observer2/KinematicBody2D")

func _ready():
	if (has_node("Enemies/Observer")):
		observer.connect("was_observed",self,"player_observed")
	if (has_node("Enemies/Observer2")):
		observer2.connect("was_observed",self,"player_observed")

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
	var character = body.get_owner().name
	Saves.level_completed.level = Metricas.current_level
	Saves.level_completed.character = character
	Metricas.save_level_completed()
	Metricas.last_level = Metricas.current_level;
	print("Metricas: " + Metricas.completed[Metricas.current_level])
	print("Personaje: " + character)
	var cond1 = ((character=="Alice") && ((Metricas.completed[Metricas.current_level]=="Bob") || (Metricas.completed[Metricas.current_level]=="Both")))
	var cond2 = (((character=="Bob") && ((Metricas.completed[Metricas.current_level]=="Alice")) || (Metricas.completed[Metricas.current_level]=="Both")))
	if ( cond1 || cond2):
		Metricas.completed[Metricas.current_level]="Both"
	else:
		Metricas.completed[Metricas.current_level]=character
	print("Metricas despues: " + Metricas.completed[Metricas.current_level])
	Autoload.message = character + " Got to the Exit"
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
	

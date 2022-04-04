extends KinematicBody2D

var frames_array = [0,8,4,12]; # número de frame para la rotación, en la textura del Sprite observer
var ray_array = [[0,1000],[1000,0],[0, -1000],[-1000,0]]; #dirección (x,y) del RayCast acompañando la rotación
var iFrame = 0;
var wait_time = 2;
onready var timer = get_node("Timer");
onready var sprite = get_node("Sprite");
onready var raycast = get_node("RayCast2D");

signal was_observed(character)

func _ready():
	timer.set_wait_time(wait_time);
	timer.start();

func _on_Timer_timeout():
	iFrame = iFrame + 1;
	sprite.frame = frames_array[iFrame % 4];
	raycast.cast_to.x = ray_array[iFrame % 4][0];
	raycast.cast_to.y = ray_array[iFrame % 4][1];


func _process(delta):
	if ((raycast.get_collider() != null) && (raycast.get_collider().get_owner().name == "Alice")):
		emit_signal("was_observed","Alice")
	if ((raycast.get_collider() != null) && (raycast.get_collider().get_owner().name == "Bob")):
		emit_signal("was_observed","Bob")

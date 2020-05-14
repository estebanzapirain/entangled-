extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var frames_array = [0,8,4,12]; # número de frame para la rotación, en la textura del Sprite observer
var ray_array = [[1000,0],[0, -1000],[-1000,0],[0, 1000]]; #dirección (x,y) del RayCast acompañando la rotación
var iFrame = 1;
var wait_time = 2;
onready var timer = get_node("Timer");
onready var sprite = get_node("Sprite");
onready var raycast = get_node("RayCast2D");

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(wait_time);
	timer.start();

func _on_Timer_timeout():
	iFrame = iFrame + 1;
	sprite.frame = frames_array[iFrame % 4];
	raycast.cast_to.x = ray_array[iFrame % 4][0];
	raycast.cast_to.y = ray_array[iFrame % 4][1];
	print(raycast.get_collider());

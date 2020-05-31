extends Node2D

const AliceStartPos = Vector2(52,-15)
const BobStartPos = Vector2(236,75)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var alice = get_parent().get_node("Alice")
onready var bob = get_parent().get_node("Bob")

# Called when the node enters the scene tree for the first time.
func _ready():
	alice.position = AliceStartPos
	bob.position = BobStartPos
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Exit_body_entered(body):
	print("Salida");

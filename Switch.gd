extends Node2D

export var id = 1
export var mode = 0 #0=button 1=switch

signal was_stepped(switch)
signal was_exited(switch)

onready var tilemap = get_node("TileMap")

func _on_Area2D_body_entered(body):
	if ((body.get_owner().name == "Alice") || (body.get_owner().name == "Bob") ):
		emit_signal("was_stepped",id)
		tilemap.set_cell(0,0,1)
		


func _on_Area2D_body_exited(body):
	if ((body.get_owner().name == "Alice") || (body.get_owner().name == "Bob") && (mode == 0) ):
		emit_signal("was_exited",id)
		tilemap.set_cell(0,0,0)

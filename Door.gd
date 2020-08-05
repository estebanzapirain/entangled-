extends Node2D

export var door_id = 0

onready var tilemap = get_node("TileMap")

func _on_Switch_was_stepped(switch):
	tilemap.set_cell(0,0,1)

func _on_Switch_was_exited(switch):
	tilemap.set_cell(0,0,0)
	print("salio switch " + str(switch) + " por puerta " + str(door_id)) 

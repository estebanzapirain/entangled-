extends Node2D

export var switch_id = 1

onready var tilemap = get_node("TileMap")

func _on_Switch_was_stepped(switch):
		if (switch == switch_id):
			tilemap.set_cell(0,0,1)

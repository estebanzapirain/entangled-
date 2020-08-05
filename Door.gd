extends Node2D

export var door_id = 0

onready var tilemap = get_node("TileMap")

func _on_Switch_was_stepped(switch): #cuando se pisa el switch, se abre la puerta (solo si coincide el id, se envia la señal en switch.gd)
	tilemap.set_cell(0,0,1)

func _on_Switch_was_exited(switch): #cuando se deja de presionar el switch. Sólo se envia la señal si está en modo 0 (pulsador)
	tilemap.set_cell(0,0,0)

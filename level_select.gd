extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AliceLev1_pressed():
	Metricas.current_level = 1
	Metricas.level_path = "res://level1.tscn"
	get_tree().change_scene("split_screen.tscn")
	
func _on_AliceLev2_pressed():
	Metricas.current_level = 2
	Metricas.level_path = "res://level2.tscn"
	get_tree().change_scene("split_screen.tscn")
	
func _on_AliceLev3_pressed():
	Metricas.current_level = 3
	Metricas.level_path = "res://level3.tscn"
	get_tree().change_scene("split_screen.tscn")


func _on_FinalLevel_pressed():
	Metricas.current_level = 99
	Metricas.level_path = "res://level_final.tscn"
	get_tree().change_scene("split_screen.tscn")


func _on_Level0_pressed():
	Metricas.level_path = "res://level0.tscn"
	get_tree().change_scene("split_screen.tscn")

extends Node2D

#Acceso a los botones de seleccion de nivel
onready var aliceLev1 = get_node("Control/AliceLev1")
onready var aliceLev2 = get_node("Control/AliceLev2")
onready var aliceLev3 = get_node("Control/AliceLev3")
onready var bobLev1 = get_node("Control/BobLev1")
onready var bobLev2 = get_node("Control/BobLev2")
onready var bobLev3 = get_node("Control/BobLev3")
onready var finalLevel = get_node("Control/FinalLevel")

func _ready(): #control de qué niveles están habilitados
	if (Metricas.completed[3]=="No"):
		finalLevel.disabled = true
	if (Metricas.completed[2]!="Bob"):
		bobLev3.disabled = true
	if (Metricas.completed[2]!="Alice"):
		aliceLev3.disabled = true
	if (Metricas.completed[1]!="Bob"):
		bobLev2.disabled = true
	if (Metricas.completed[1]!="Alice"):
		aliceLev2.disabled = true
		
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

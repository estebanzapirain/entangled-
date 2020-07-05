extends Node

onready var label = self.get_node("Message")
onready var time_label = self.get_node("TimeLabel")
onready var timer = get_node("Timer")

func _ready():
	label.text = Autoload.message

func _process(delta):
	time_label.text = str(stepify(timer.time_left,1))
	
func _on_continuarBtn_pressed():
	get_tree().change_scene("res://level_select.tscn") #ir al world original


func _on_Timer_timeout():
	get_tree().change_scene("res://level_select.tscn") #ir al world original

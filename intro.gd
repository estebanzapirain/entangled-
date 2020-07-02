extends Node

var story_step = 0 #step of the story showing in screen
const number_of_steps = 8 #total number of steps
const story_steps = ["Two qubits, both alike in state,\nbonded tightly from the beginning,\nthen ripped apart from each other's arms,\nsent far away, away from their reach.\nThis is their story.","This is a story.","This is a love story.","This is a tragic love story.","Two souls. Two qubits. Alice and Bob.\nJoint from the beginning, taken apart in the end.","Ssshhh! A call between remote places.\n A silent call, on a link no one can spy on.","Alice:\n\n Bob! Wait, I'm coming for you!","Bob: \n\nAlice! I will cross the world \njust to be with you again!","Evil Eve: \n\nObservers! Disperse over the world,\n look out for those two!\n We cannot foresee what would happen\n if they join together!"] #texts of each story step
onready var label = self.get_node("Label")


func _ready():
	label.text = story_steps[0]
	print(story_steps.size())
	pass # Replace with function body.

func _on_continuarBtn_pressed():
	story_step+=1
	if story_step<=number_of_steps:	
		print(story_step)
		label.text = story_steps[story_step]
	else:
		get_tree().change_scene("res://level_select.tscn") #ir al world original



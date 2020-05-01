extends Node

onready var viewport1 = $viewport_container/vieport_1/Viewport
onready var viewport2 = $viewport_container/vieport_2/Viewport
onready var camera1 = $viewport_container/vieport_1/Viewport/Camera2D
onready var camera2 = $viewport_container/vieport_2/Viewport/Camera2D
#onready var world = $viewport_container/vieport_1/Viewport/world

func _ready():
	viewport2.world_2d = viewport1.world_2d
	
	pass


# warning-ignore:unused_argument
func _physics_process(delta):
	#camera1.global_position = $viewport_container/vieport_1/Viewport/myWorld/Level/Alice.global_position
	#camera2.global_position = $viewport_container/vieport_1/Viewport/myWorld/Level/Bob.global_position
	camera1.position = $viewport_container/vieport_1/Viewport/myWorld/Level/Alice.position
	camera2.position = $viewport_container/vieport_1/Viewport/myWorld/Level/Bob.position
	

extends Node

onready var viewport1 = $viewport_container/vieport_1/Viewport
onready var viewport2 = $viewport_container/vieport_2/Viewport
onready var camera1 = $viewport_container/vieport_1/Viewport/Camera2D
onready var camera2 = $viewport_container/vieport_2/Viewport/Camera2D

func _ready():
	viewport2.world_2d = viewport1.world_2d
	pass


# warning-ignore:unused_argument
func _physics_process(delta):
	camera1.global_position = $viewport_container/vieport_1/Viewport/myWorld/Alice/KinematicBody2D/Sprite.global_position
	camera2.global_position = $viewport_container/vieport_1/Viewport/myWorld/Bob/KinematicBody2D/Sprite.global_position


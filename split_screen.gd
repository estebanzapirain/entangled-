extends Node

onready var viewport1 = $viewport_container/vieport_1/Viewport
onready var viewport2 = $viewport_container/vieport_2/Viewport
onready var camera1 = $viewport_container/vieport_1/Viewport/Camera2D
onready var camera2 = $viewport_container/vieport_2/Viewport/Camera2D
#onready var world = $viewport_container/vieport_1/Viewport/world
onready var target = $viewport_container/vieport_1/Viewport/myWorld

func _ready():
	var next_level_resource = load(Metricas.level_path)
	var next_level = next_level_resource.instance()
	target.add_child(next_level)
	viewport2.world_2d = viewport1.world_2d
	
# warning-ignore:unused_argument
func _physics_process(delta):
	camera1.global_position = $viewport_container/vieport_1/Viewport/myWorld/Level/Alice/KinematicBody2D/Sprite.global_position
	camera2.global_position = $viewport_container/vieport_1/Viewport/myWorld/Level/Bob/KinematicBody2D/Sprite.global_position
	

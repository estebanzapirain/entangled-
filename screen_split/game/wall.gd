extends StaticBody2D

func _ready():
	$polygon.polygon = $collision.polygon
	pass

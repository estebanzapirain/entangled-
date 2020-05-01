extends RigidBody2D

export var id = 0
export var speed = 10
export (Texture) var texture
var velocity = Vector2()

func _ready():
	$sprite.texture = texture
	pass


func moving():
	velocity = Vector2()
	if Input.is_action_pressed("left_" + str(id)):
		velocity.x -= 1
	elif Input.is_action_pressed("right_" + str(id)):
		velocity.x += 1
	if Input.is_action_pressed("up_" + str(id)):
		velocity.y -= 1
	if Input.is_action_pressed("down_" + str(id)):
		velocity.y += 1
	
	velocity = velocity.normalized() * speed
	apply_impulse(Vector2(), velocity)
	




# warning-ignore:unused_argument
func _physics_process(delta):
	moving()

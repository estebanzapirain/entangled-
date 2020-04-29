extends KinematicBody2D

export var speed = 50
var moving_via_mouse = false
var target = Vector2()
var velocity = Vector2()

func get_input():
	velocity = Vector2()
	# cant move via keys if moving with the mouse
	if moving_via_mouse == false:
		if Input.is_action_pressed("right"):
			velocity.x -= 1
		if Input.is_action_pressed("left"):
			velocity.x += 1
		if Input.is_action_pressed("up"):
			velocity.y += 1
		if Input.is_action_pressed("down"):
			velocity.y -= 1
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		target = get_global_mouse_position()
		moving_via_mouse = true
	$AnimationPlayer.play("Walk");
	
func _physics_process(delta):
	get_input()
	if moving_via_mouse:
		velocity = (target - position).normalized() * speed
		
		
	if position.distance_to(target) < 5 and moving_via_mouse:
		moving_via_mouse = false
		velocity = Vector2.ZERO
	
	if velocity == Vector2.ZERO:
		$AnimationPlayer.play("Idle")
		
		velocity = Vector2.ZERO
		
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)
	velocity = Vector2.ZERO


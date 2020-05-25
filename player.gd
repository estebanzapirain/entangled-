extends KinematicBody2D

const analog_threshold = 0.2 #valor de umbral para el control analogico de Android
export (int) var speed = 50
var moving_via_mouse = false
var target = Vector2()
var velocity = Vector2()
var _dir = Vector2(0,0)

func get_input():
	velocity = Vector2()
	# cant move via keys if moving with the mouse
#	if moving_via_mouse == false:
	if Input.is_action_pressed("right1") or Input.is_action_pressed("left2"):
		velocity.x += 1
	if Input.is_action_pressed("left1") or Input.is_action_pressed("right2"):
		velocity.x -= 1
	if Input.is_action_pressed("up1") or Input.is_action_pressed("down2"):
		velocity.y -= 1
	if Input.is_action_pressed("down1") or Input.is_action_pressed("up2"):
		velocity.y += 1
#	if Input.is_mouse_button_pressed(BUTTON_LEFT):
#		target = get_global_mouse_position()
#		moving_via_mouse = true
	$AnimationPlayer.play("Walk");
	
func _physics_process(delta):
	get_input()
#	if moving_via_mouse:
#		velocity = (target - position).normalized() * speed		
#	if position.distance_to(target) < 5 and moving_via_mouse:
#		moving_via_mouse = false
#		velocity = Vector2.ZERO
	if velocity == Vector2.ZERO:
		$AnimationPlayer.play("Idle")
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)

	
func analog_force_change(inForce, inAnalog):
	#Control analogico para Alice (el jugador 1)
	if(inAnalog=="AliceAnalog"):
		if (inForce.x > analog_threshold):
			Input.action_press("right1");
			Input.action_release("left1");
			Input.action_release("up1");
			Input.action_release("down1");
		else:
			if (inForce.x < -analog_threshold):
				Input.action_press("left1");
				Input.action_release("right1");
				Input.action_release("up1");
				Input.action_release("down1");
			else:
				if (inForce.y > analog_threshold):
					Input.action_press("up1");
					Input.action_release("right1");
					Input.action_release("left1");
					Input.action_release("down1");
				else:
					if (inForce.y < -analog_threshold):
						Input.action_press("down1");
						Input.action_release("right1");
						Input.action_release("left1");
						Input.action_release("up1");
					else:
						Input.action_release("right1");
						Input.action_release("left1");
						Input.action_release("up1");
						Input.action_release("down1");
#Control de Bob
	if(inAnalog=="BobAnalog"):
		if (inForce.x > analog_threshold):
			Input.action_press("right2");
			Input.action_release("left2");
			Input.action_release("up2");
			Input.action_release("down2");
		else:
			if (inForce.x < -analog_threshold):
				Input.action_press("left2");
				Input.action_release("right2");
				Input.action_release("up2");
				Input.action_release("down2");
			else:
				if (inForce.y > analog_threshold):
					Input.action_press("up2");
					Input.action_release("right2");
					Input.action_release("left2");
					Input.action_release("down2");
				else:
					if (inForce.y < -analog_threshold):
						Input.action_press("down2");
						Input.action_release("right2");
						Input.action_release("left2");
						Input.action_release("up2");
					else:
						Input.action_release("right2");
						Input.action_release("left2");
						Input.action_release("up2");
						Input.action_release("down2");

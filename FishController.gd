extends CharacterBody2D


const SPEED = 300.0
var startMovingUp = false

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xAxis = Input.get_axis("move_left", "move_right")
	var yAxis = Input.get_axis("move_up", "move_down")
	if xAxis:
		velocity.x = xAxis * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if yAxis:
		velocity.y = yAxis * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if startMovingUp:
		if position.y > 200:
			velocity.y = -100*(abs(position.y-170)/30)
		else:
			startMovingUp = false
	move_and_slide()


func _on_tween_fish_tween_one():
	startMovingUp = true # Replace with function body.

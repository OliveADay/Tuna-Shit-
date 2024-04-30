extends CharacterBody2D


const SPEED = 300.0
var startMovingUp = false

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if startMovingUp:
		if position.y > 200:
			velocity.y = -100
		else:
			startMovingUp = false
			velocity.y = 0
	move_and_slide()


func _on_tween_fish_tween_one():
	if position.y > 200:
		velocity.y = -100
		startMovingUp = true
		move_and_slide() # Replace with function body.

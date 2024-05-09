extends CharacterBody2D

@export var grazePeriod = 0.2
const SPEED = 150.0
var startMovingUp = false
var health = 3 
var grazeTime = 0
@export var healthTxt = Label
var yaxisPressed = false
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
		yaxisPressed = true
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if yaxisPressed:
		velocity.y -= 20#MAKE THIS WORK AFTER BUTTON PRESSED
	
	if startMovingUp:
		if position.y > 200:
			velocity.y = -100*(abs(position.y-170)/30)
		else:
			startMovingUp = false
	move_and_slide()

func _process(delta):
	healthTxt.text = str(health)
	if $Area2D.has_overlapping_bodies() and grazeTime <= 0:
		$AudioStreamPlayer2D.playing = true
		health -= 1
		grazeTime = grazePeriod
		if health == 0:
			get_tree().reload_current_scene()
	if grazeTime > 0:
		grazeTime -= delta

func _on_tween_fish_tween_one():
	startMovingUp = true # Replace with function body.

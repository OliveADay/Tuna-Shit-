extends Sprite2D
@export var speed = 10
@export var maxPos = 300

var prevPos = 1

signal moveToFar()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= 300*delta
	if position.y <= maxPos and prevPos >= maxPos:
		moveToFar.emit()
		
	prevPos = position.y
		



func _on_wave_6_move_to_far():
	position.y = 295 # change so that it moves the other way
	
func activate_HeightPos():
	maxPos = 201

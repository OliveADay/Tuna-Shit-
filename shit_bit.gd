extends RigidBody2D
var rand = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	rand = randi()%4
	if rand == 0:
		linear_velocity = Vector2(0, 100)
		constant_torque = 90
	if rand == 1:
		linear_velocity = Vector2(0,-300)
		constant_torque = 90
	if rand ==2:
		linear_velocity = Vector2(300,0)
	if rand == 3:
		linear_velocity = Vector2(-300,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($Area2D.has_overlapping_bodies()):
		parent = get_tree().root #this unparents perminantely, make it not perminant

extends Node2D

var time = 0.0
var shits = [preload("res://shit.tscn").instantiate(), preload("res://shit.tscn").instantiate(), preload("res://shit.tscn").instantiate(), preload("res://shit.tscn").instantiate()]
@export var interval = Vector2(2, 0.3)
var currentShit = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if time >= interval.x:
		time = 0
		add_child(shits[currentShit])
		shits[currentShit].remove_from_group("OutOCam")
		currentShit += 1
		if currentShit > 3:
			currentShit = 0
	else:
		time += delta
		
	for i in shits.size():
		if shits[i].is_in_group("OutOCam"):
			remove_child(shits[i])

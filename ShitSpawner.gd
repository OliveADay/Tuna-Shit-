extends Node2D

var time = 0.0
var shits = [preload("res://shit.tscn"), preload("res://shit.tscn"), preload("res://shit.tscn"), preload("res://shit.tscn")]
@export var interval = Vector2(2, 0.3)
var currentShit = 0
var active = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		
		if time >= interval.x:
			time = 0
			var shit = shits[0].instantiate()
			add_child(shit)
			#shits[currentShit].remove_from_group("OutOCam")
			currentShit += 1
			if currentShit > 3:
				currentShit = 0
		else:
			time += delta
		#figure out how to reset everything else about the nodes so that they can be reintroduced


func _on_label_key_pressed():
	active = true # Replace with function body.

extends Node2D

@export var speed = 300

var shitBit_1 = preload("res://shit_bit.tscn").instantiate()
var shitBit_2 = preload("res://shit_bit.tscn").instantiate()
var shitBit_3 = preload("res://shit_bit.tscn").instantiate()
var shitBit_4 = preload("res://shit_bit.tscn").instantiate()

var landOne = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$sprite.visible = true
	scale = Vector2(2,2)
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(scale.x > 0.25):
		scale.x -= speed*delta
		scale.y -= speed*delta
	else: if not landOne:
		$CPUParticles2D.emitting = true
		add_child(shitBit_1)
		add_child(shitBit_2)
		add_child(shitBit_3)
		add_child(shitBit_4)
		landOne = true
		$sprite.visible = false
	if shitBit_1.is_in_group("OutOCam") and shitBit_2.is_in_group("OutOCam") and shitBit_3.is_in_group("OutOCam") and shitBit_4.is_in_group("OutOCam"):
			add_to_group("OutOCam")
			scale = Vector2(2,2)
			

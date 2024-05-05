extends Node2D

@export var speed = 300

var landOne = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(scale.x > 0.25):
		scale.x -= speed*delta
		scale.y -= speed*delta
	else: if not landOne:
		$CPUParticles2D.emitting = true
		landOne = true
		$sprite.visible = false

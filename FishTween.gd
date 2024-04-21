extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween().set_loops() # Replace with function body.
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_EXPO)
	tween.tween_property(get_parent(), "rotation_degrees", 30.0, 0.4)
	#tween.tween_interval(2)
	tween.tween_property(get_parent(), "rotation_degrees", -30, 0.8)
	#tween.tween_interval(4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

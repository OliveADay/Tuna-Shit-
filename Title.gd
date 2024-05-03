extends Label
signal keyPressed
var keyPressedOnce = false
# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween().set_loops() # Replace with function body.
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(get_parent(), "rotation_degrees", 10.0, 1.5)
	#tween.tween_interval(2)
	tween.tween_property(get_parent(), "rotation_degrees", -10, 3) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_anything_pressed() and not keyPressedOnce:
		keyPressed.emit()
		keyPressedOnce = true
		var tween = create_tween()
		tween.set_ease(Tween.EASE_IN)
		tween.set_trans(Tween.TRANS_EXPO)
		tween.tween_property(get_parent(), "position", Vector2(41, -20), 1)

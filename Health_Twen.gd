extends Label

var start = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if start:
	#var tween = create_tween().set_loops() # Replace with function body.
	#tween.set_ease(Tween.EASE_IN)
	#tween.set_trans(Tween.TRANS_SINE)
	#tween.tween_property(get_parent(), "rotation_degrees", 10.0, 1.5)
	#tween.tween_interval(2)
	#tween.tween_property(get_parent(), "rotation_degrees", -10, 3) # Replace with function body.
	pass



func _on_label_key_pressed():
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUINT)
	tween.tween_property(get_parent(), "position", Vector2(16, 13), 2)
	$AudioStreamPlayer2D.playing = true
	start = true

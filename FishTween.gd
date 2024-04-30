extends Node2D
@export var sprite = Sprite2D
signal fishTweenOne
# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween().set_loops() # Replace with function body.
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_EXPO)
	tween.tween_property(sprite, "rotation_degrees", 30, 0.4)
	#tween.tween_interval(2)
	tween.tween_property(sprite, "rotation_degrees", -30, 0.8)
	#tween.tween_interval(4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_label_key_pressed():
	var tween = create_tween().set_loops(1)
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(get_parent(), "scale", Vector2(2,2), 1) # Replace with function body.
	fishTweenOne.emit()
	#sprite.position = Vector2(0,0) 
	#get_parent().position.y = Vector2(66,221)

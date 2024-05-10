extends Node2D

@export var bScoreTxt = Label
var time = 0.0
var shits = [preload("res://shit.tscn"), preload("res://shit.tscn"), preload("res://shit.tscn"), preload("res://shit.tscn")]
@export var interval = Vector2(2, 0.3)
var currentShit = 0
var active = false
var score = 0
var scoreExel = 1
var scoretext_late = ""
var scoreFilePath = "user://score.save"
var bScore = 0
@export var scoreTxt = Label
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		score += (delta/interval.x)/1.5
		scoreTxt.text = str(score).pad_decimals(0)
		if scoreTxt.text != scoretext_late and scoreTxt.text != "0":
			$AudioStreamPlayer2D.playing = true
		if(interval.x > 0.001):
			interval.x -= delta/100
		else:
			interval.x = 0.001
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
		scoretext_late = scoreTxt.text
	LoadBScore()
	bScoreTxt.text = "Best Score: " + str(bScore).pad_decimals(0)
	if bScore < score:
		SaveBScore()
		#figure out how to reset everything else about the nodes so that they can be reintroduced


func _on_label_key_pressed():
	active = true # Replace with function body.
	
func SaveBScore():
	var file = FileAccess.open(scoreFilePath, FileAccess.WRITE)
	file.store_var(score)
	
func LoadBScore():
	if FileAccess.file_exists(scoreFilePath):
		var file = FileAccess.open(scoreFilePath, FileAccess.READ)
		bScore = file.get_var(score)
	else:
		bScore = 0

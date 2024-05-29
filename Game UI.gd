extends Control

var score = 0
@onready var scoreLabel = $Score

func _process(delta):
	score += .15
	scoreLabel.text = "Score: %d" % score

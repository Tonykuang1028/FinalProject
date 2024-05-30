extends Control

var spawn_score_threshold = 100
var enemy_scene = preload("res://bossroom.tscn")
var score = 0
@onready var scoreLabel = $Score


func _process(delta):
	score += .15
	scoreLabel.text = "Score: %d" % score

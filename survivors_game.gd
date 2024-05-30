extends Node2D

var spawn_score_threshold = 100
var enemy_scene = preload("res://stone_golem.tscn")
var player_score = 0
@onready var player = $Player

func spawn_enemy():
	var enemy_instance = enemy_scene.instance()
	enemy_instance.position = Vector2(0,0)
	
func _on_score_updated(new_score):
	player_score = new_score
	if player_score >= spawn_score_threshold:
		spawn_enemy()


func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob) 
	


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
	

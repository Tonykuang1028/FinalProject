extends Area2D

var travelled_distance = 0


func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta 
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE :
		queue_free()
	


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
		
#
#
#func _on_visible_on_screen_notifier_2d_screen_exited():
	#queue_free()

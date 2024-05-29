extends Area2D

var travelled_distance = 0

@onready var animated_sprite = $AnimatedSprite2D
@onready var player = get_parent().find_child("Player")


var acceleration: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta):
	
	const SPEED = 400
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE :
		queue_free()
	
	acceleration = (player.position - position).normalized() * 900
	
	velocity += acceleration * delta
	rotation = velocity.angle()
	
	velocity = velocity.limit_length(150)
	
	position += velocity * delta
	
	


func _on_body_entered(_body):
	queue_free()
	const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
	var smoke = SMOKE_SCENE.instantiate()
	get_parent().add_child(smoke)
	smoke.global_position = global_position

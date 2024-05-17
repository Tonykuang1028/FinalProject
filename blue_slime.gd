extends CharacterBody2D

var health = 1

@onready var player = get_node("/root/Game/Player")

func play_walk():
	%AnimationPlayer.play("walk")


func play_hurt():
	%AnimationPlayer.play("death")
	%AnimationPlayer.queue("walk")



func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()
	
	
		
func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	if health == 0:
		queue_free()


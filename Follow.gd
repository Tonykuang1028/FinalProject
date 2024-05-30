extends State

func _enter():
	super._enter()
	owner.set_physics_process(true)
	animation_player.play("idle")
	
func _exit():
	super._exit()
	owner.set_physics_process(false)
	
func transition():
	var distance =  owner.direction.length()
	
	if distance < 50: 
		get_parent().change_state("MeeleAttack")
	elif distance > 300:
		var chance = randi() % 2
		match chance:
			0:
				get_parent().change_state("HomingMissile")
			1:
				get_parent().change_state("LaserBeam")
		

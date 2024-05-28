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
	
	if distance < 30: 
		get_parent().change_state("MeeleAttack")
	elif distance > 130:
		get_parent().change_state("HomingMissile")

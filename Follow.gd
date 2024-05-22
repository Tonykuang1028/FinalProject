extends State

func _enter():
	super._enter()
	owner.set_physics_process(true)
	animation_player.play("idle")
	
func _exit():
	super._exit()
	owner.set_physics_process(false)
	

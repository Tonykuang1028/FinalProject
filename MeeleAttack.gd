extends State

func _enter():
	super._enter()
	animation_player.play("meele_attack")
	
func transition():
	if owner.direction.length() > 150:
		get_parent().change_state("Follow")

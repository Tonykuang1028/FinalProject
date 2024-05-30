extends State

func _enter():
	super._enter()
	animation_player.play("death")
	await animation_player.animation_finished
	animation_player.play("boss_slained")

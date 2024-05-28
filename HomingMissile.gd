extends State

@export var bulleted_node: PackedScene
var can_transition: bool = false

func _enter():
	super._enter()
	animation_player.play("ranged_attack")
	await animation_player.animation_finished
	shoot()
	can_transition = true

func shoot():
	var bulleted = bulleted_node.instantiate()
	bulleted.position = owner.position
	get_tree().current_scene.add_child(bulleted)
	
func transition():
	if can_transition:
		can_transition = false
		get_parent().change_state("Dash")


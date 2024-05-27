extends Node2D
class_name State

@onready var debug = owner.find_child("debug")
@onready var player = get_parent().find_child("player")
@onready var animation_player = owner.find_child("AnimationPlayer")




func _ready():
	set_physics_process(false)
	
func _enter():
	set_physics_process(true)
	
func _exit():
	set_physics_process(false)
	
func transition():
	pass
	
func _physics_process(_delta):
	transition()
	debug.text = name
	

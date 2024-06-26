extends MarginContainer

const first_scene_path  = ("res://survivors_game.tscn")
var first_scene_instance = null

@onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
@onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector

var current_selection = 0

func _ready():
	set_current_selection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 2:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
	elif Input.is_action_just_pressed("ui_select"):
		load_first_scene()
	
	
func handle_selection(_current_selection):
	if _current_selection == 0:
		load_first_scene()
	elif _current_selection == 1:
		get_tree().quit()




func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
		
func load_first_scene():
	if not first_scene_instance:
		var scene = load(first_scene_path)
		if scene:
			first_scene_instance = scene
			var instance = first_scene_instance.instance()
			if instance:
				get_tree().root.add_child(instance)
				return
	else:
		var instance = first_scene_instance.instance()
		if instance:
			get_tree().root.add_child(instance)
		
		

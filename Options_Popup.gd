extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var back_clicked = null
var globals

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect all of the options menu buttons
	$Button_Back.connect("pressed", self, "options_menu_button_pressed", ["back"])
	$Button_Fullscreen.connect("pressed", self, "options_menu_button_pressed", ["fullscreen"])
	$Check_Button_VSync.connect("pressed", self, "options_menu_button_pressed", ["vsync"])
	$Check_Button_Debug.connect("pressed", self, "options_menu_button_pressed", ["debug"])
	$HSlider_Mouse_Sensitivity.connect("value_changed", self, "set_mouse_and_joypad_sensitivity", [])
	$HSlider_Joypad_Sensitivity.connect("value_changed", self, "set_mouse_and_joypad_sensitivity", [])
	
	globals = get_node("/root/Globals")
	# Get the mouse and joypad sensitivity
	$HSlider_Mouse_Sensitivity.value = globals.mouse_sensitivity
	$HSlider_Joypad_Sensitivity.value = globals.joypad_sensitivity

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func options_menu_button_pressed(button_name):
	if button_name == "back":
		if back_clicked != null:
			back_clicked.call_func()
		else:
			print("no 'back' event given to options popup")
		self.visible = false
	elif button_name == "fullscreen":
		OS.window_fullscreen = !OS.window_fullscreen
	elif button_name == "vsync":
		OS.vsync_enabled = $Check_Button_VSync.pressed
	elif button_name == "debug":
		get_node("/root/Globals").set_debug_display($Check_Button_Debug.pressed)


func set_mouse_and_joypad_sensitivity():
	# Get the globals singleton
	var globals = get_node("/root/Globals")
	# Set the mouse and joypad sensitivity
	globals.mouse_sensitivity = $HSlider_Mouse_Sensitivity.value
	globals.joypad_sensitivity = $HSlider_Joypad_Sensitivity.value

extends Control

# NOTE: The code here is only briefly explained in the tutorial, nor
#		does the code have very many comments!
#		This is because it does not really relate to making a FPS.

var start_menu
var level_select_menu
var options_menu
var globals

export (String, FILE) var testing_area_scene
export (String, FILE) var space_level_scene
export (String, FILE) var ruins_level_scene


func _ready():
	start_menu = $Start_Menu
	level_select_menu = $Level_Select_Menu
	options_menu = $Options_Popup
	options_menu.back_clicked = funcref(self, "options_menu_back_clicked")
	options_menu.visible = false
	
	# Connect all of the start menu buttons
	$Start_Menu/Button_Start.connect("pressed", self, "start_menu_button_pressed", ["start"])
	$Start_Menu/Button_Open_Godot.connect("pressed", self, "start_menu_button_pressed", ["open_godot"])
	$Start_Menu/Button_Options.connect("pressed", self, "start_menu_button_pressed", ["options"])
	$Start_Menu/Button_Quit.connect("pressed", self, "start_menu_button_pressed", ["quit"])
	
	# Connect all of the level select menu buttons
	$Level_Select_Menu/Button_Back.connect("pressed", self, "level_select_menu_button_pressed", ["back"])
	$Level_Select_Menu/Button_Level_Testing_Area.connect("pressed", self, "level_select_menu_button_pressed", ["testing_scene"])
	$Level_Select_Menu/Button_Level_Space.connect("pressed", self, "level_select_menu_button_pressed", ["space_level"])
	$Level_Select_Menu/Button_Level_Ruins.connect("pressed", self, "level_select_menu_button_pressed", ["ruins_level"])
	
	# Some times when returning to the title screen the mouse is still captured even though it shouldn't be.
	# To prevent this from breaking the game, we just set it here too
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	# Get the globals singleton
	globals = get_node("/root/Globals")


func start_menu_button_pressed(button_name):
	if button_name == "start":
		level_select_menu.visible = true
		start_menu.visible = false
	elif button_name == "open_godot":
		OS.shell_open("https://godotengine.org/")
	elif button_name == "options":
		options_menu.visible = true
		start_menu.visible = false
	elif button_name == "quit":
		get_tree().quit()

func options_menu_back_clicked():
	start_menu.visible = true

func level_select_menu_button_pressed(button_name):
	if button_name == "back":
		start_menu.visible = true
		level_select_menu.visible = false
	elif button_name == "testing_scene":
		get_node("/root/Globals").load_new_scene(testing_area_scene)
	elif button_name == "space_level":
		get_node("/root/Globals").load_new_scene(space_level_scene)
	elif button_name == "ruins_level":
		get_node("/root/Globals").load_new_scene(ruins_level_scene)

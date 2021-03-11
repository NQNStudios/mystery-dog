extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var globals

# Called when the node enters the scene tree for the first time.
func _ready():
	$Options_Popup.visible = false
	globals = get_node("/root/Globals")

func _process(delta):
	# If ui_cancel is pressed, we want to close this menu
	if Input.is_action_just_pressed("ui_cancel"):
		globals.popup_closed()

func options_menu_back_clicked():
	$Options_Popup.visible = false
	self.visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends Button

@onready var twists: Twists = get_tree().root.get_node("FaustianTabView/Twists")

func _ready():
	assert(twists != null, "twists obj is null for number button")
	self.pressed.connect(set_number)
	twists.updated.connect(check_toggle)
	
func set_number(): 
	twists.selected_number = self.text
	twists.updated.emit()

func check_toggle():
	self.set_pressed_no_signal(twists.selected_number == self.text)

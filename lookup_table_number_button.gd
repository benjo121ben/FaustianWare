extends Button

@onready var lookup_table: CardLookupTable = $"../.."

func _ready():
	assert(lookup_table != null, "Lookup table is null for number button")
	self.pressed.connect(set_number)
	lookup_table.updated.connect(check_toggle)
	
func set_number(): 
	lookup_table.selected_number = self.text
	lookup_table.updated.emit()

func check_toggle():
	self.set_pressed_no_signal(lookup_table.selected_number == self.text)

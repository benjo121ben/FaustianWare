extends Button

@onready var lookup_table: CardLookupTable = $"../.."
@export var suit: CardLookupTable.Suit = CardLookupTable.Suit.CLUB

func _ready():
	assert(lookup_table != null, "Lookup table is null for suit button")
	self.pressed.connect(set_suit)
	lookup_table.updated.connect(check_toggle)

func set_suit(): 
	lookup_table.selected_suit = self.suit
	lookup_table.updated.emit()

func check_toggle():
	self.set_pressed_no_signal(lookup_table.selected_suit == self.suit)

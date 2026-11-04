extends Label

@onready var lookup_table: CardLookupTable = $"../../.."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lookup_table.updated.connect(update)
	
func update():
	self.text = lookup_table.get_text()
	

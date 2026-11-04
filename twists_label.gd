extends Label

@onready var twists: Twists = get_tree().root.get_node("FaustianTabView/Twists")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	twists.updated.connect(update)
	
func update():
	self.text = twists.get_text()
	

@tool
extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_import)


func _import():
	var f = FileAccess.open("res://twists.txt", FileAccess.READ)
	var content = f.get_as_text()
	
	var data = TwistsData.new()
	
	for entry in content.split(";"):
		var number =  entry.split("__")[0].strip_edges()
		var description = entry.split("__")[1].replace("\n", " ").strip_escapes().strip_edges().replace("{nl}", "\n")
		data.table[number] = description
		
	# import completed. validation:
	for i in range(1, 14):
		var key = str(i)
		if i == 1:
			key = "Ace"
		elif i == 11:
			key = "Jack"
		elif i == 12:
			key = "Queen"
		elif i == 13:
			key = "King"
		assert(data.table.get(key) != null, "Twists is missing " + key)
	
	var result = ResourceSaver.save(data, "res://twists_data.tres")
	assert(result == OK, "saving failed")
	print("Import of Twists succeeded")

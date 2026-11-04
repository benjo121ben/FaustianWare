@tool
extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_import)


func _import():
	var f = FileAccess.open("res://lookup_table.txt", FileAccess.READ)
	var content = f.get_as_text()
	
	var data = CardLookupTableData.new()
	
	for entry in content.split(";"):
		var card_info =  entry.split(":")[0].strip_edges().strip_escapes()
		var description = entry.split(":")[1].strip_edges().replace("\n", "").replace("\r", " ")
		
		var number = card_info.split("of")[0].strip_edges()
		var suit = card_info.split("of")[1].strip_edges().to_lower()
		
		match suit:
			"spades":
				data.spades_table[number] = description
			"hearts":
				data.hearts_table[number] = description
			"clubs":
				data.clubs_table[number] = description
			"diamonds":
				data.diamonds_table[number] = description
			_: 
				assert(false, "suit " + suit + " does not exist")
		
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
		assert(data.hearts_table.get(key) != null, "Hearts is missing " + key)
		assert(data.clubs_table.get(key) != null, "Clubs is missing " + key)
		assert(data.diamonds_table.get(key) != null, "Diamonds is missing " + key)
		assert(data.spades_table.get(key) != null, "Spades is missing " + key)
		
	var result = ResourceSaver.save(data, "res://scheme_data.tres")
	assert(result == OK, "saving failed")
	print("Import of Lookup Table succeeded")

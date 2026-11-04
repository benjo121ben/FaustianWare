extends Node
class_name Twists

@export var twists_data: TwistsData = null
@export var selected_number: String = "1"
signal updated

func get_text() -> String:
	return twists_data.table.get(selected_number)

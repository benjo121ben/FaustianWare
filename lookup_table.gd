extends Node
class_name CardLookupTable

@export var lookup_data: CardLookupTableData = null


enum Suit {
	HEART,
	DIAMOND,
	CLUB,
	SPADE
}

@export var selected_suit: Suit = Suit.CLUB
@export var selected_number: String = "2"

signal updated


func get_text() -> String:
	if lookup_data == null:
		return "DATA IS NULL"
		
	return lookup_data.get_text(selected_suit, selected_number)
	

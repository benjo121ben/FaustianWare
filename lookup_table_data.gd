extends Resource
class_name CardLookupTableData

@export var hearts_table : Dictionary[String, String] = {}
@export var clubs_table : Dictionary[String, String] = {}
@export var diamonds_table : Dictionary[String, String] = {}
@export var spades_table : Dictionary[String, String] = {}


func get_text(suit: CardLookupTable.Suit, number: String) -> String:
	match suit:
		CardLookupTable.Suit.DIAMOND:
			return diamonds_table[number]
			
		CardLookupTable.Suit.HEART:
			return hearts_table[number]
			
		CardLookupTable.Suit.CLUB:
			return clubs_table[number]
			
		CardLookupTable.Suit.SPADE:
			return spades_table[number]
		
		_: return "ERROR"
			

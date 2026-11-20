suits = {
    "Spades": "Butcher's Crew: Roustabouts and ruffians who run protection rackets, supported by their willingness to inflict truly ruthless violence.", 
    "Clubs": "Circle of the White Palm: Smugglers who traffic narcotics and spices in exchange for occult texts and dark magic.", 
    "Hearts": "Our Lady's Grace. Sex workers and souteneurs who service both common folk and nobles across the archipelago.", 
    "Diamonds": "Magpie Society. Thieves, gamblers, and artists who value rare works of art and chivalric robbery."
}
numbers = [ #starts with 2
    "Street Urchin",
    "Starving Artist",
    "Unscrupulous Merchant",
    "Hired Muscle",
    "Quick-Talking Con Artist",
    "Experienced Criminal",
    "Corrupt Accountant",
    "Forbidden Magician",
    "Bossy Lieutenant",
    "Up-And-Coming Rival",
    "Shadowy Consigliere",
    "The Pirate-Lord of the Syndicate"
]

ace_suits = {
    "Spades": "Air Companion: They don't cause other Accomplices to Fall, and they don't Fall when other members of their same Suit Fall.", 
    "Clubs": "Fire Companion: They don't cause other Accomplices to Fall, and they don't Fall when other members of their same Suit Fall.", 
    "Hearts": "Water Companion: They don't cause other Accomplices to Fall, and they don't Fall when other members of their same Suit Fall.", 
    "Diamonds": "Earth Companion: They don't cause other Accomplices to Fall, and they don't Fall when other members of their same Suit Fall."
}





for key, value in suits.items():
    print("Ace of " + key + " __ Your " + ace_suits[key])
    for index, number in enumerate(numbers):
        final_card = str(index + 2)
        if index + 2 == 11:
            final_card = "Jack"
        if index + 2 == 12:
            final_card = "Queen"
        if index + 2 == 13:
            final_card = "King"
        
        print(final_card + " of " + key + " __ " + number + "\n" + value + ";")
    
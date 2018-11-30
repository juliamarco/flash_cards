require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'pry'

# Inside of this file, write the code to do the following:
#
# Create some Cards
# Put those card into a Deck
# Create a new Round using the Deck you created
# Start the round using a new method called start (round.start)

puts "Welcome! You're playing with 4 cards."
puts "-------------------------------------------------"
puts "This is card number 1 out of 4."

card_1 = Card.new("Who painted a late 15th-century mural known as the Last Supper?", "Leonardo da Vinci", :Art)
puts "Question: #{card_1.question}"


# card_2 = Card.new("What is the meaning of the French expression 'C/'est la vie'?", "That's life", :Language)
# card_3 = Card.new("Penicillin was discovered in 1928 by which Scottish scientist?", "Alexander Fleming", :Science)
# card_4 = Card.new("What is the word for 'Hello' in Spanish?", "Hola", :Language)
# deck = Deck.new([card_1, card_2, card_3, card_4])
# round = Round.new(deck)
#
#
# round.take_turn("Juneau")
# round.take_turn("Venus")

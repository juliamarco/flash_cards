require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'pry'




card_1 = Card.new("Who painted a late 15th-century mural known as the Last Supper?", "LEONARDO DA VINCI", :Art)
card_2 = Card.new("What is the meaning of the French expression 'C'est la vie'?", "THAT'S LIFE", :Language)
card_3 = Card.new("Penicillin was discovered in 1928 by which Scottish scientist?", "ALEXANDER FLEMING", :Science)
card_4 = Card.new("What is the word for 'Hello' in Spanish?", "HOLA", :Language)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)
round.start
round.end

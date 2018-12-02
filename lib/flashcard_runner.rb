require './lib/card_generator'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'pry'

filename = "cards.txt"

cards = CardGenerator.new(filename).create_deck
deck = Deck.new(cards)
round = Round.new(deck)
round.start

require '../lib/card'
require '../lib/deck'
require '../lib/turn'


class Round
  attr_reader :deck,
              :turns,
              :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @number_correct = 0

  end

  def take_turn(guess)
    @new_turn = Turn.new(guess, @current_card)
    @turns << @new_turn
    return @new_turn
  end

  def number_correct
    if @new_turn.correct?
    @number_correct += 1
    end
  end
end


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)
new_turn = round.take_turn("Juneau")
p round.number_correct

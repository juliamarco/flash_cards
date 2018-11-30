require './lib/card'
require './lib/deck'
require './lib/turn'


class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    return new_turn
  end


  def number_correct
    number_correct = 0
    @turns.each do |turn|
      if turn.correct?
        number_correct += 1
      end
    end
    return number_correct
  end

  def number_correct_by_category(category)
    number_correct_by_category = 0
    @turns.each do |turn|
      if turn.card.category == category
         number_correct_by_category += 1
      end
      return number_correct_by_category
    end
  end

  def percent_correct
    number_correct / @turns.count.to_f * 100.0
  end

  def percent_correct_by_category(category)
    total_of_that_category = 0
      @turns.each do |turn|
      if turn.card.category == category
         total_of_that_category += 1
      end
    end
    number_correct_by_category = number_correct_by_category(category)
    number_correct_by_category / total_of_that_category * 100.0
  end

end

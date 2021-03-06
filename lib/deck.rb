require './lib/card'
require 'pry'


class Deck
attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end


  def cards_in_category(category = "STEM")
    cards_ordered_by_category = []
    cards.each do |card|
      if card.category == category
        cards_ordered_by_category << card
      end
    end
    cards_ordered_by_category
  end

end

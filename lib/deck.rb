require '../lib/card'
require 'pry'


class Deck
attr_reader :cards,
            :count

  def initialize(cards)
    @cards = cards
    @count = @cards.length
    @cards_ordered_by_category = []
  end



  def cards_in_category(category)
    cards.each do |card|
      if card.category == category
        @cards_ordered_by_category << card
      end
    end
    @cards_ordered_by_category
  end

end

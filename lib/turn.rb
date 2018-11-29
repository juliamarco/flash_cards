require './lib/card'

class Turn
attr_accessor :guess,
              :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    card.answer == guess
  end

  def feedback
    if correct?
      return "Correct!"
    else
      return "Incorrect"
    end
  end

end

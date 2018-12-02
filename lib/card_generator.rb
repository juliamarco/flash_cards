require './lib/card'

class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def read_file
    file = open(@filename)
    all_questions = []
    file.each_line do |line|
    each_question = line.split(",")
    all_questions << each_question
    end
    return all_questions
  end

  def create_deck
    all_cards = []
    read_file.map do |question|
    each_card = Card.new(question[0], question[1], question[2])
    all_cards << each_card
    end
    return all_cards
  end

end

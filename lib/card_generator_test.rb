require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require 'pry'

class CardGeneratorTest < Minitest::Test


  def test_it_exists
    filename = "cards.txt"
    cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, cards
  end

  def test_read_file
    filename = "cards.txt"
    cards = CardGenerator.new(filename).create_deck

    assert_equal "LEONARDO DA VINCI", cards[0].answer
    assert_equal "Language", cards[1].category.chomp
    assert_equal "Science", cards[2].category.chomp
    assert_equal "What is the word for 'Hello' in Spanish?", cards[3].question
  end


end

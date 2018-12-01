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


  def start

      puts "Welcome! You're playing with 4 cards."
      puts "-------------------------------------------------"
      puts "This is card number 1 out of 4."

      puts "Question: #{current_card.question}"
      answer_to_card_1 = gets.chomp.upcase
      turn = take_turn(answer_to_card_1)
      p turn.feedback
      puts "This is card number 2 out of 4."
      puts "Question: #{current_card.question}"
      answer_to_card_2 = gets.chomp.upcase
      turn_2 = take_turn(answer_to_card_2)
      p turn_2.feedback
      puts "This is card number 3 out of 4."
      puts "Question: #{current_card.question}"
      answer_to_card_3 = gets.chomp.upcase
      turn_3 = take_turn(answer_to_card_3)
      p turn_3.feedback
      puts "This is card number 4 out of 4."
      puts "Question: #{current_card.question}"
      answer_to_card_4 = gets.chomp.upcase
      turn_4 = take_turn(answer_to_card_4)
      p turn_4.feedback


    end

  def end
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of 4 for a total score of #{percent_correct}."
    puts "Art - #{percent_correct_by_category(:Art)} correct"
    puts "Language- #{percent_correct_by_category(:Language)} correct"
    puts "Science - #{percent_correct_by_category(:Science)} correct"

  end

end

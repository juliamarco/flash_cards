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
         if turn.correct?
           number_correct_by_category += 1
         end
      end
    end
    return number_correct_by_category
  end

  def percent_correct
    number_correct / @turns.count.to_f * 100.0
  end

  def percent_correct_by_category(category)
    total_of_that_category = 0
    total_correct_of_category = 0
      @turns.each do |turn|
        if turn.card.category == category
         total_of_that_category += 1
        end
      end
      @turns.each do |turn|
        if turn.card.category == category && turn.correct?
          total_correct_of_category += 1
        end
      end
    return (total_correct_of_category.to_f / total_of_that_category.to_f) * 100.0
  end

  def start
      card_count = 1
      card_total = 4
      puts "Welcome! You're playing with 4 cards."
      puts "-------------------------------------------------"

      until card_count == card_total + 1
      puts "This is card number #{card_count} out of #{card_total}."
      puts "Question: #{current_card.question}"
      answer_to_card = gets.chomp.upcase
      turn = take_turn(answer_to_card)
      p turn.feedback
      card_count += 1
      end

      puts "****** Game over! ******"
      puts "You had #{number_correct} correct guesses out of #{card_total} for a total score of #{percent_correct}."

      categories_in_actual_turn = []
      @turns.each do |turn|
        if categories_in_actual_turn.include? turn.card.category
        else
        categories_in_actual_turn << turn.card.category
        end
      end

      categories_in_actual_turn.each do |category|
        puts "#{category} - #{percent_correct_by_category(category)} correct"
      end
    end
  end

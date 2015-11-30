require_relative 'card'
require_relative 'deck'
require_relative 'player'

require 'pry'

class High_Low
  attr_accessor :deck, :player

  def initialize(player)
    @deck = Deck.new('high_low')
    @player = player
  end
  
  def compare(card_1, card_2)
    comparison = card_1.value - card_2.value
    if comparison == 0
      'tie'
    elsif comparison < 0
      'higher'
    else
      'lower'
    end
  end


  def high_low_round(card)
    bet = @player.place_bet
    if card == nil
      puts 'Dealer flips'
      first_card = @deck.pick_card
      puts first_card
    else
      first_card = card
      puts first_card
    end
    puts "Will the next card be higher or lower?"
    answer = gets.strip
    @flipped_card = @deck.pick_card
    puts @flipped_card
    value = compare(first_card, @flipped_card)
    if value == 'tie'
      puts 'TIE!'
    elsif  answer == value
      puts 'You win'
       @player.bankroll += bet
    else
      puts 'You lose'
       @player.bankroll -= bet
    end
    puts "You now have $#{@player.bankroll}"
  end

  def high_low_game
    puts "Let's Play High-Low"
    answer = ''
    @flipped_card = nil
    while answer != 'exit'
      high_low_round(@flipped_card)
      if @player.bankroll <= 0
        puts 'You are too poor to play again'
        answer = 'exit'
      elsif @deck.length <= 2
        puts 'Reshuffling'
        @deck = Deck.new
      else
        puts 'Play again or exit?'
        answer = gets.strip
      end
    end
  end



end
# p1 =Player.new("sj", 12)
# game = Games.new(p1)
# game.high_low_game


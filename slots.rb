#ten symbols
#three reels
# place bet
# if not all match, bet goes into jackpot
# if win, win jackpotxs

require_relative 'player'
class Slots
  attr_accessor :player, :symbols, :jackpot

  def initialize(player)
    @player = player
    @symbols = ['cherry', '7', 'horseshoe', 'skull', 'luck clover', 'star', 'key', 'penny', 'camel', 'shield']
    @jackpot = 100
  end

  def slots_pull
    slots = []
    3.times { slots << symbols.sample }
    (0..2).each do |index| 
      puts slots[index]
      puts `sleep 0.5`
    end
    if slots.include? 'camel' && slots.uniq.length == 1
      puts 'JACKPOT WINNER'
      @player.bankroll += @jackpot
    elsif slots.include? 'camel'
      puts 'Camel Bonus!'
      puts 'You win an extra $25'
      @player.bankroll += (25 + @bet)
    elsif slots.uniq.length == 1
      puts 'Winner!'
      @player.bankroll += @jackpot
    else
      puts 'Loser!'
    end
    puts "You now have $#{@player.bankroll}"
  end

  def slots_game
    puts "Let's play Slots"
    answer = ''
    while answer != 'exit'
      @bet = @player.place_bet
      @jackpot += @bet
      @player.bankroll -= @bet
      slots_pull
      if @player.bankroll <= 0
        puts 'You are too poor to play again'
        answer = 'exit'
      else
        puts 'Play again or exit?'
        answer = gets.strip
        puts `clear` if answer != 'exit'
      end
    end
  end

end
# puts `clear` to clean up how it looks?
# p1 =Player.new("sj", 12)
# game = Slots.new(p1)
# game.slots_game
# common methods = exit if bankroll =0, play again or exit
# def bankroll
#   if @player.bankroll <= 0
#     puts 'You are too poor to play again'
#     answer = 'exit'
#   end
# end
# def play_again
#   else
#     puts 'Play again or exit?'
#     answer = gets.strip
#     puts `clear` if answer != 'exit'
#   end
# end
#

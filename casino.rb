# Casino Project:
# Basic Objectives:
# 1. Start game player has a name and an initial bank roll
# 2. Player can go to different games via menu
# a. Slots
# b. High / Low
# 3. Player places bet and wins / loses (hint: rand)
# 4. Player's bankroll goes up and down with wins and losses
# Bonus objective:
# 1. Player's bankroll persists while moving from game to game
# 2. Random events occur when changing games that can increase or decrease player's
# bank roll
# 3. Roulette
# 4. Build a card deck
# 5. Card games
# include Random_Events
def start_high_low
  new_game = High_Low.new(@player)
  new_game.high_low_game
  puts 'Leaving High-Low Table'
end

def start_slots
  new_game = Slots.new(@player)
  new_game.slots_game
  puts 'Leaving Slot Machine'
end

@games = {'2'=> {name: 'Slots', method: Proc.new { start_slots } },
          '3'=> {name: 'High/Low',  method: Proc.new { start_high_low } },
          '4'=> {name: 'Exit Casino', method: Proc.new { exit(0) } }, 
    }

require_relative 'card'
require_relative 'player'
require_relative 'deck'
require_relative 'high_low'
require_relative 'slots'

def create_player
  puts 'Enter player name:'
  player_name = gets.strip
  puts 'Enter player bankroll:'
  player_bankroll = gets.to_i
  Player.new(player_name, player_bankroll)
end

def choose_game
  choice = ''
  while choice != '4'
    @games.each {|index, game| puts "#{index}. #{game[:name]}"}
    # puts '1. Blackjack'
    # puts '2. Slots'
    # puts '3. High/Low'
    # puts '4. Exit Casino'
    choice = gets.strip
    case choice
    when  '1', '2', '3'
      puts @player
      @games[choice][:method].call
    when '4'
      puts 'Goodbye! Thank you for playing.'
      puts "You have $#{@player.bankroll}"
      @games[choice][:method].call
    else
      puts 'Invalid input'
    end
  end
end

def main_menu
  @player = create_player
  choose_game
end

main_menu
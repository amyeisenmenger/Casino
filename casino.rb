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

require_relative 'card'
require_relative 'player'
require_relative 'deck'
require_relative 'high_low'

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
    puts '1. Blackjack'
    puts '2. Slots'
    puts '3. High/Low'
    puts '4. Exit Casino'
    choice = gets.strip
    case choice
    when '3'
      puts @player
      new_game = High_Low.new(@player)
      new_game.high_low_game
      puts 'Leaving High-Low Table'
    when '4', 'exit'
      puts 'Exiting Casino'
      exit
    end
  end
end

def main_menu
  @player = create_player
  choose_game
end

main_menu
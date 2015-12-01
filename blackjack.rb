# require_relative 'card'
# require_relative 'deck'
# require_relative 'player'

require 'pry'
require 'color-console'

class Blackjack
	attr_accessor :player, :deck

	def initialize(player)
		@player = player
		@deck = deck
		@deck = Deck.new('blackjack')
		@player_cards = []
		@dealer_cards = []
		@player_total = 0
		@dealer_total = 0

	end

	def add_card(person)
		#sleep(0.5)
		card = @deck.pick_card
		case person
			when 'dealer'
				@dealer_cards << card
				@dealer_total += card.value
			when 'player'
				@player_cards << card
				@player_total += card.value
				
		end
		# puts "dealer total: #{@dealer_total}"
		# puts "player total: #{@player_total}"
	end

	def display_cards(all = false)
		puts `clear`
		@divider = '**********************'
		Console.puts "#{@divider}", :green  
		#puts @divider
		puts "dealer is showing:"
		#determine if the dealer is showing the down card
		number_of_cards = @dealer_cards.count 
		card_ticker = 1

		if all == true
			card_ticker = 0
		end

		while card_ticker <= number_of_cards
				puts @dealer_cards[card_ticker]
				card_ticker += 1
		end
		
		Console.puts "#{@divider}", :green 
		puts "Player: #{@player.name} has:"
		@player_cards.each do |card|
			puts card
		end
		#puts "dealer total: #{@dealer_total}"
		#puts "player total: #{@player_total}"

		Console.puts "#{@divider}", :green 

	end

	def first_deal
		add_card('dealer')
		add_card('dealer')

		add_card('player')
		add_card('player')

		#check for blackjack
		if @player_total == 21 && @dealer_total != 21
			puts 'Blackjack!'
			@bet = @bet *1.5
			@player.bankroll += @bet
			blackjack_round
		end

		if @player_total == 21 && @dealer_total == 21
			Puts 'You where so close! Push.'
			blackjack_round
		end
		
	end

	def blackjack_round
		reset_round
		@bet = @player.place_bet
		first_deal
		display_cards
		hit_stand
	end

	def reset_round
		@player_total = 0
		@dealer_total = 0

		@player_cards = []
		@dealer_cards = []

		puts "Bankroll = $#{player.bankroll}"

		#blackjack_game
	end

def check_player_total
	@player_total = check_or_ace(@player_cards, @player_total)
		if @player_total <= 21
			hit_stand
		else
			puts 'You bust'
			@player.bankroll -= @bet
		end
end

def check_or_ace(cards, total)
	@ace_count = 0
	
	cards.each do |card|
		if card.value == 11
			#puts 'Has Ace'
			@ace_count += 1
			#puts "Ace count #{@ace_count}"
		end
	end
	
	while @ace_count >0

		if total >21
			total -=10
			if total <= 21
				return total
				break
			end
			@ace_count -=1
		end
	end
	return total
end


def hit_stand
	Console.puts 'hit or stand?', :yellow 
	#puts 'hit or stand?'
	decision = gets.strip

	if decision == 'hit' || decision == 'h'
		add_card('player')
		display_cards
		check_player_total
		
	
	elsif decision == 'stand' || decision == 's'
		puts 'you stand'
		display_cards(true)
		dealer_hit_stand
	else
		Console.puts 'Invalid input! Please type "hit" or "stand" (h/s)', :red  
		check_player_total
	end
end

def dealer_hit_stand
		while @dealer_total <17
			add_card('dealer')
			puts 'dealer takes a card'
			@dealer_total = check_or_ace(@dealer_cards, @dealer_total)
			display_cards(true)
		end

		if @dealer_total > 21
			puts 'Dealer busts, you win!' 
			@player.bankroll += @bet
		elsif @dealer_total == @player_total
			puts 'Push'
		elsif @dealer_total < @player_total
			puts 'You win!'
			@player.bankroll += @bet
		elsif @dealer_total > @player_total
			puts 'You lose'
			@player.bankroll -= @bet
		end

end


def blackjack_game
	# Move all of this to a module?  There are examples in slack (classes and modules and pry)
	puts "Let's Play Blackjack"
  answer = ''
  while answer != 'exit'
    blackjack_round
    if @player.bankroll <= 0
      puts 'You are too poor to play again'
      answer = 'exit'
    elsif @deck.length <= 10
      puts 'Reshuffling'
      @deck = Deck.new('blackjack')
    else
      puts 'Play again or exit?'
      answer = gets.strip
    end
  end
	
end


end

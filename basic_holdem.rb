require_relative 'player'
require_relative 'deck'
require_relative 'poker_hand'
class Basic_Holdem
  attr_accessor :player_hand, :shared_cards
  #creates a game with one player and one computer with semi infinite amount of money
  def initialize(player)
    @player = player
    @computer = Player.new("Computer",9_000_000)
  end

  #deals player, computer hands, and also deals all 5 shared cards
  #creates a new deck each time
  def deal_hand
    deck = Deck.new
    @player_hand = [deck.pick_card,deck.pick_card]
    @computer_hand = [deck.pick_card,deck.pick_card]
    @shared_cards =[ deck.pick_card,deck.pick_card,deck.pick_card,deck.pick_card,deck.pick_card]
  end

  #given a hand and shared cards determines best possible hand (out of 21)
  def best_hand(hand)
    seven_cards = []
    seven_cards << hand[0] << hand[1]
    @shared_cards.each{ |card| seven_cards << card }
    possible_hands = seven_cards.combination(5)
    hands = possible_hands.map{| hnd | Poker_Hand.new(hnd)  }
    hands.sort[0]

  end
  #prints hands of player and computer and prints shared cards
  def print_hands
    puts"Player Cards"
    @player_hand.each { |card| print "#{card} "}
    puts"\n#####"
    sleep(1)
    puts "Shared Cards"
    @shared_cards.each {|card| print "#{card} "}
    puts"\n#####"
    sleep(1)
    puts "Computer cards"
    @computer_hand.each { |card| print "#{card} "}
    puts"\n#####"
    sleep(1)
  end

  #determines and display results of a single hand
  def print_results(bet)
    computer_best = best_hand( @computer_hand)
    player_best = best_hand( @player_hand)
    puts "Player has #{player_best.hand_type}"
    puts player_best
    puts"#####"
    puts "Computer has #{computer_best.hand_type}"
    puts computer_best
    int = player_best.compare(computer_best)
    if int == 0
      puts 'Players tie'
    elsif int > 0
      puts "Player wins"
      @player.bankroll += bet
    else
      puts "Computer wins"
      @player.bankroll -= bet
    end
  end

  #plays a single game
  def single_game
    puts "player has #{@player.bankroll}"
    bet = @player.place_bet
    deal_hand
    print_hands
    print_results(bet)
  end

  #main method to get game starting a loops until
  #user types 'n' or 'no'
  def start_game
    puts"Welcome to hold em"
    input = 'nil'
    while input != 'n' && input != 'no'
      single_game
      puts"would you like to play agian (y)es or (n)o"
      input = gets.strip
    end
  end
end


#how to start game
#1 create a game instance object with one player
#2 call instance.start_game
game = Basic_Holdem.new(Player.new("james",100))
game.start_game
#game will exit after user types 'n' or 'no'



#slots ideas
# arr =[1,2,3,4,5,6,7,8,9]
# sl1, sl2, sl,  = arr.sample, arr.sample, arr.sample
# sleep(1)
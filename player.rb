

class Player
  attr_accessor :name, :bankroll

  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
  end

  def place_bet 
    bet = @bankroll + 1
    while bet > @bankroll
      puts "Place Your Bet:"
      bet = gets.to_i
      puts 'Bet exceeds bankroll.' if bet > @bankroll
    end
    bet
  end

  def to_s
    "Hello #{@name} you have $#{bankroll}"
  end

end

#if bankroll is 0 and bet is 0 it doesn't kick you out
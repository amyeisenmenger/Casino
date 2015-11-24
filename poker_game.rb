require_relative 'player'
require_relative 'deck'
require_relative 'poker_hand'
class Poker_Game
  attr_accessor :h1, :h2, :h3, :h4, :h5, :h6, :h7, :h8, :h9

  def initialize
   # @players = player_arr
    @deck = Deck.new

  end

  def deal
    @h1= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,])
    @h2= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,])
    @h3= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,])
    @h4= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,])
    @h5= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,])
    @h6= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,])
    @h7= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,])
    @h8= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,])
    @h9= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,])
  end

  def pri
    puts "#{@h1} \n #{@h1.rank.inspect}" if @h1.rank[0]<=6
    puts "#{@h2} \n #{@h2.rank.inspect}" if @h2.rank[0]<=6
    puts "#{@h3} \n #{@h3.rank.inspect}" if @h3.rank[0]<=6
    puts "#{@h4} \n #{@h4.rank.inspect}" if @h4.rank[0]<=6
    puts  "#{@h5} \n #{@h5.rank.inspect}" if @h5.rank[0]<=6
    puts "#{@h6} \n #{@h6.rank.inspect}" if @h6.rank[0]<=7
    puts "#{@h7} \n #{@h7.rank.inspect}" if @h7.rank[0]<=7
    puts "#{@h8} \n #{@h8.rank.inspect}" if @h8.rank[0]<=7
    puts "#{@h9} \n #{@h9.rank.inspect}" if @h9.rank[0]<=8

  end
end

game = Poker_Game.new

game.deal
game.pri


# A Hearts
# 10 Hearts
# A Diamonds
# A Clubs
# 10 Clubs
#[3, 10, 14]

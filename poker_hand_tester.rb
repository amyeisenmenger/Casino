require_relative 'player'
require_relative 'deck'
require_relative 'poker_hand'
class PokerHandTester
  attr_accessor :h1, :h2, :h3, :h4, :h5, :h6, :h7, :h8, :h9, :hands

  def initialize
   # @players = player_arr
    @deck = Deck.new
    @hands = nil

  end

  def deal
    @hands = [
    @h1= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card]),
    @h2= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card]),
    @h3= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card]),
    @h4= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card]),
    @h5= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card]),
    @h6= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card]),
    @h7= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card]),
    @h8= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card]),
    @h9= Poker_Hand.new([@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card,@deck.pick_card])]
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

# rf = [Card.new({'2'=> 2}, 'hearts'),Card.new({'3'=> 3}, 'hearts'),Card.new({'4'=> 4}, 'hearts'),
#        Card.new({'5'=> 5}, 'hearts'),Card.new({'6'=> 6}, 'hearts')]
#
# royal = Poker_Hand.new(rf)
# puts "rf: " + royal.rank.inspect
#
# fk = [Card.new({'2'=> 2}, 'hearts'),Card.new({'2'=> 2}, 'hearts'),Card.new({'2'=> 2}, 'hearts'),
#       Card.new({'2'=> 2}, 'hearts'),Card.new({'6'=> 6}, 'hearts')]
#
# four_kind = Poker_Hand.new(fk)
# puts "fk: " + four_kind.rank.inspect
#
#
# fh = [Card.new({'2'=> 2}, 'hearts'),Card.new({'2'=> 2}, 'hearts'),Card.new({'2'=> 2}, 'hearts'),
#       Card.new({'6'=> 6}, 'hearts'),Card.new({'6'=> 6}, 'hearts')]
#
# full_house= Poker_Hand.new(fh)
# puts "fh: " + full_house.rank.inspect
#
# f = [Card.new({'2'=> 2}, 'hearts'),Card.new({'8'=> 8}, 'hearts'),Card.new({'4'=> 4}, 'hearts'),
#      Card.new({'5'=> 5}, 'hearts'),Card.new({'6'=> 6}, 'hearts')]
#
# flush = Poker_Hand.new(f)
# puts "fl: " + flush.rank.inspect
#
#
# s = [Card.new({'2'=> 2}, 'clubs'),Card.new({'3'=> 3}, 'hearts'),Card.new({'4'=> 4}, 'hearts'),
#       Card.new({'5'=> 5}, 'hearts'),Card.new({'6'=> 6}, 'hearts')]
#
# straight = Poker_Hand.new(s)
# puts "st: " + straight.rank.inspect
#
# three = [Card.new({'2'=> 2}, 'hearts'),Card.new({'2'=> 2}, 'spades'),Card.new({'2'=> 2}, 'diamonds'),
#       Card.new({'6'=> 6}, 'hearts'),Card.new({'7'=> 7}, 'hearts')]
#
# three_kind= Poker_Hand.new(three)
# puts "3k: " + three_kind.rank.inspect
#
#
# tp = [Card.new({'2'=> 2}, 'hearts'),Card.new({'2'=> 2}, 'spades'),Card.new({'10'=> 10}, 'diamonds'),
#          Card.new({'6'=> 6}, 'hearts'),Card.new({'6'=> 6}, 'diamonds')]
#
# two_pair = Poker_Hand.new(tp)
# puts "tp: " + two_pair.rank.inspect
#
#
# tk = [Card.new({'2'=> 2}, 'hearts'),Card.new({'2'=> 2}, 'spades'),Card.new({'10'=> 10}, 'diamonds'),
#       Card.new({'6'=> 6}, 'hearts'),Card.new({'7'=> 7}, 'hearts')]
#
# two_kind = Poker_Hand.new(tk)
# puts "tk: " + two_kind.rank.inspect
#
# hk = [Card.new({'2'=> 2}, 'hearts'),Card.new({'a'=> 12}, 'spades'),Card.new({'10'=> 10}, 'diamonds'),
#       Card.new({'6'=> 6}, 'hearts'),Card.new({'7'=> 7}, 'hearts')]
#
# high = Poker_Hand.new(hk)
# puts "hk: " + high.rank.inspect
#
#
# puts two_kind.compare(high)
# puts high.compare(two_kind)

game = PokerHandTester.new

game.deal
#game.pri

a =game.hands.sort
a.each {|hand| puts hand}




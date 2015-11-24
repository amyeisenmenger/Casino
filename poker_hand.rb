require_relative 'card'
require 'pry'
class Poker_Hand
  include Comparable
  include Enumerable
  attr_reader :hand, :values ,:suites

  #constructor
  def initialize(cards)
    @hand = cards
    @values = cards.collect {|card| card.value}.sort
    @suites = cards.collect {|card| card.suit}
    @unique_values = @values.uniq
    @unique_cards =  @unique_values.size
  end

  #Checks for  royal flush, flush, straight, high card
  def check_unique_hand
    flush = flush?
    straight = straight?
    ## could do proc calls here
    return [ 1, self.values[4] ] if flush && straight
    return [ 4, self.values[0..4].reverse ].flatten  if flush
    return [ 5, self.values[4] ] if straight
    [ 9, self.values[0..4].reverse ].flatten # high card
  end

  #Checks for  4 of kind, full house,
  def check_pairs
    case @unique_cards
      when 2
        pairs = @values.select{|value| @values.count(value) > 1}.uniq
        pairs.size == 1 ? four_of_kind(pairs) : full_house(pairs)
      when 3
        pairs = @values.select{|value| @values.count(value) > 1}.uniq
        pairs.size == 1 ? three_of_kind(pairs) : two_pair(pairs)
      else
        pair = @values.select{|value| @values.count(value) > 1}.uniq
        two_of_kind(pair)

    end
  end

  def flush?

    @suites.uniq.size == 1 ? true : false
  end

  def straight?
    @values.last - @values.first == 4 ? true : false
  end

  def four_of_kind(four_pair_card)
    [2,four_pair_card[0], @unique_values.select {|e| e != four_pair_card[0]}].flatten
  end

  def full_house(pairs)
    @values.count(pairs[0] == 3 ) ? [3, pairs[0], pairs[1]] : [3, pairs[1], pairs[0]]
  end

  def three_of_kind(pair)
    kickers = @unique_values.select{|e| e != pair[0]}
    [6,pair[0],kickers.sort.reverse].flatten
  end
  def two_pair(pairs)
    kicker = @unique_values.select{|e| e != pairs[0] && e != pairs[1]}
    [7,pairs.sort.reverse, kicker].flatten
  end

  def two_of_kind(pair)
    kickers = @unique_values.select {|e| e != pair[0]}
    [8,pair,kickers.sort.reverse].flatten
  end


  #returns rank of hand
  def rank
    @unique_cards == 5 ? check_unique_hand : check_pairs
  end

  def to_s
    @hand.each {|card| puts card}
  end

  def <=>(other)
    self.rank > other.rank
  end
  def >(other)
    self.rank > other.rank
  end

  def each
    @hand.each {|card| yield card }
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















# fh = [Card.new({'a'=> 14}, 'hearts'),Card.new({'10'=> 10}, 'hearts'),Card.new({'a'=> 14}, 'Diamonds'),
#       Card.new({'a'=> 14}, 'clubs'),Card.new({'10'=> 6}, 'clubs')]
#
# full_house= Poker_Hand.new(fh)
# puts "fh: " + full_house.rank.inspect


# A Hearts
# 10 Hearts
# A Diamonds
# A Clubs
# 10 Clubs
#[3, 10, 14]


# 9 Spades
# 9 Diamonds
# A Clubs
# 9 Hearts
# K Diamonds
# #<Poker_Hand:0x007fd91c801c70>
# [8, 10, 6, 8, 14]

# 4 Diamonds
# 8 Clubs
# 8 Hearts
# 8 Spades
# 9 Hearts
# #<Poker_Hand:0x007fd53d018780>
# [8, 10, 6, 7, 13]
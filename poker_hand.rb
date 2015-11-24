require_relative 'card'
require 'pry'
class Poker_Hand
  include Comparable
  include Enumerable
  attr_reader :hand, :values ,:suites
  NAMES = [nil,'Nutin','pair','Two pair', 'Three of a Kind', 'Straight', 'Flush','Full house','Four of a Kind','straight Flush']
  #constructor
  def initialize(cards)
    @hand = cards
    @values = cards.collect {|card| card.value}.sort
    @suites = cards.collect {|card| card.suit}
    @unique_values = @values.uniq
    @unique_cards =  @unique_values.size
    @rank = rank

  end

  #Handles  straight flush, flush, straight, high card
  def check_unique_hand
    flush = flush?
    straight = straight?
    ## could do proc calls here
    return [ 9, self.values[4] ] if flush && straight
    return [ 6, self.values[0..4].reverse ].flatten  if flush
    return [ 5, self.values[4] ] if straight
    [ 1, self.values[0..4].reverse ].flatten # high card
  end

  #Handles 4 of kind, full house, three of kind, two pair, and two of kind
  def check_pairs
    pairs = @values.select{|value| @values.count(value) > 1}.uniq
    case @unique_cards
      when 2
        pairs.size == 1 ? four_of_kind(pairs) : full_house(pairs)
      when 3
        pairs.size == 1 ? three_of_kind(pairs) : two_pair(pairs)
      else
        two_of_kind(pairs)
    end
  end

  #checks if all suits are same
  def flush?
    @suites.uniq.size == 1 ? true : false
  end
  #uses subtraction to check for straight. doesn't check a2345 straight
  def straight?
    @values.last - @values.first == 4 ? true : false
  end

  def four_of_kind(four_pair_card)
    [8,four_pair_card[0], @unique_values.select {|e| e != four_pair_card[0]}].flatten
  end

  def full_house(pairs)
    @values.count(pairs[0] == 7 ) ? [7, pairs[0], pairs[1]] : [7, pairs[1], pairs[0]]
  end

  def three_of_kind(pair)
    kickers = @unique_values.select{|e| e != pair[0]}
    [4,pair[0],kickers.sort.reverse].flatten
  end
  def two_pair(pairs)
    kicker = @unique_values.select{|e| e != pairs[0] && e != pairs[1]}
    [3,pairs.sort.reverse, kicker].flatten
  end

  def two_of_kind(pair)
    kickers = @unique_values.select {|e| e != pair[0]}
    [2,pair,kickers.sort.reverse].flatten
  end


  #returns rank of hand as array of ints which very in length depending on hand
  # first element tells what kind of hand it is 9(straight flush)-
  # 1(high-card).
  def rank
    @unique_cards == 5 ? check_unique_hand : check_pairs
  end

  def to_s
    @hand.each {|card| print "#{card} "}
  end
  def hand_type
    "#{NAMES[@rank[0]]} "
  end

  #is reversed so hand with highest value is first element
  #when sorted
  def <=>(other)
    other.compare(self)
  end
  def compare(other)
    #if not same hand ie flush vs straight
    if self.rank[0] != other.rank[0]
      return self.rank[0] - other.rank[0]
    else
      #tiebreaker
      for i in 1..self.rank.length
        return self.rank[i] - other.rank[i] if self.rank[i] != other.rank[i]
      end
    end
    #return 0 if tie
    0
  end

  def each
    @hand.each {|card| yield card }
  end
  #
  # def >(other)
  #   self.rank > other.rank
  # end


end

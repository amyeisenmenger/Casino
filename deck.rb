require_relative 'card'

class Deck
  attr_accessor :stack_of_cards

  def initialize
    ranks = [{'2'=> 2}, {'3' => 3}, {'4' => 4}, {'5'=>5}, {'6'=>6}, {'7' => 7},
     {'8'=>8}, {'9'=>9}, {'10'=>10}, {'J' =>11}, {'Q'=> 12}, {'K' => 13}, {'A'=>14}]
    suits = %w{Spades Hearts Clubs Diamonds}
    @stack_of_cards = suits.each_with_object([]) do |suit, res|
      ranks.size.times do |i|
        res << Card.new(ranks[i], suit)
      end
    end
    @stack_of_cards.shuffle!
  end

  def pick_card
    @stack_of_cards.shift
  end

  def length
    @stack_of_cards.length
  end


end
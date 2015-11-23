class Card
  attr_accessor :rank, :suit


  def initialize(rank, suit)
    @rank = rank
    @suit = suit
   
  end
  def value
    @rank.values[0]
  end

  def to_s
    "#{@rank.keys[0]} #{@suit}"  
  end
end

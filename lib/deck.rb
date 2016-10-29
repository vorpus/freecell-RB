require_relative 'card'

class Deck
  attr_accessor :deck
  def initialize
    @deck = []
    Card.suits.product(Card.values) do |suit, val|
      @deck << Card.new(suit, val)
    end
    shuffle!
  end

  def shuffle!
    @deck.shuffle!
  end

  def take
    @deck.pop
  end

  def empty?
    @deck.empty?
  end
end

if __FILE__ == $PROGRAM_NAME
  d = Deck.new
  puts d.deck
end
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

  def take_one
    @deck.pop
  end

  def empty?
    @deck.empty?
  end
end

require_relative 'card'

class Deck
  attr_accessor :deck
  def initialize
    @deck = []
    Card.suits.product(Card.values) do |suit, val|
      @deck << Card.new
    end
    shuffle!
  end

  def shuffle!

  end

  def take_one

  end

  def empty?

  end
end

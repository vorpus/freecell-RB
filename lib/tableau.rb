class Tableau
  attr_accessor :stack
  
  def initialize(cards)
    @stack = cards
  end

  def topcard
    @stack.last
  end

  def add(card)
    if topcard.nil? || (card.numval == topcard.numval - 1) && (card.color != topcard.color)
      @stack << card
    else
      raise "Invalid move"
    end
  end

  def take(card)
    @stack.pop
  end

end

if __FILE__ == $PROGRAM_NAME
  require_relative 'card'
  t = Tableau.new
  js = Card.new(:spades, :jack)
  th = Card.new(:hearts, :ten)
  ts = Card.new(:diamonds, :nine)
  t.add(js)
  t.add(th)
  t.add(ts)
end

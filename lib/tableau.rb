class Tableau
  attr_accessor :stack

  def initialize(cards = [])
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

  def take_one
    @stack.pop
  end

end

class Homecell < Tableau
  def add(card)
    if topcard.nil? && card.value == :ace
      @stack << card
    else
      if (card.numval == topcard.numval + 1) && (card.suit == topcard.suit)
        @stack << card
      else
        raise "Invalid move for home cell"
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  require_relative 'card'
  t = Tableau.new
  js = Card.new(:spades, :jack)
  th = Card.new(:hearts, :ten)
  ad = Card.new(:diamonds, :ace)
  t.add(js)
  t.add(th)
  # t.add(ts)
  h = Homecell.new
  td = Card.new(:diamonds, :deuce)
  th = Card.new(:hearts, :three)
  h.add(ad)
  h.add(td)
  h.add(th)
  p h
end

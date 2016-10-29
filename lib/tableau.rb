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

class Freecell < Tableau
  def add(card)
    if topcard.nil?
      @stack << card
    else
      raise "Freecell can only hold one card at a time."
    end
  end
end

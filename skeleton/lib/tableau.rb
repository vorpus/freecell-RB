class Tableau
  attr_accessor :stack

  def initialize(cards = [])
    @stack = cards
  end

  def topcard

  end

  def add(card)
    @stack << card
  end

  def take_one

  end

end

class Homecell
  def add(card)
    @stack << card
  end
end

class Freecell
  def add(card)
    @stack << card
  end
end

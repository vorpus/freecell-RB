require 'colorize'

class Card
  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  SUIT_COLORS = {
    :clubs => :black,
    :spades => :black,
    :diamonds => :red,
    :hearts => :red
  }

  VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  FREECELL_VALUE = {
    :ace  => 1,
    :deuce => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13
  }

  # Returns an array of all suits.
  def self.suits
    SUIT_STRINGS.keys
  end

  # Returns an array of all values.
  def self.values
    VALUE_STRINGS.keys
  end

  attr_accessor :suit, :value

  def initialize(suit, value)

  end

  def color
    SUIT_COLORS[self.suit]
  end



  def inspect
    stringified = ""
    stringified << " " if self.value != :ten
    stringified << "#{VALUE_STRINGS[self.value]}#{SUIT_STRINGS[self.suit]}"
    stringified.colorize(:color => SUIT_COLORS[self.suit], :background => :light_white)
  end

  def numval

  end

end

if __FILE__ == $PROGRAM_NAME
  k = Card.new(:spades, :jack)
  puts k.num_value
end

class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def get_move
    move = gets.chomp.split(",")
    [clean_position(move[0]), clean_position(move[1])]
  end

  def clean_position(pos)
    if pos.length == 1
      [pos.to_i, :tableau]
    elsif pos.length == 2
      twopart = pos.split("")
      case twopart[1]
      when "t"
        nextpart = :tableau
      when "f"
        nextpart = :freecell
      when "h"
        nextpart = :homecell
      else
        raise "Please specify tableau, freecell, or homecell"
      end
      [twopart[0].to_i, nextpart]
    else
      raise "Couldn't parse input."
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  playa = Player.new("michael scarn")
  p playa.get_move
end

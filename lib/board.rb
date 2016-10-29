require_relative 'card'
require_relative 'deck'
require_relative 'tableau'
require_relative 'player'

class Board
  attr_accessor :deck, :freecell, :tableau, :homecell, :player
  def initialize(player, deck = nil)
    @player = player

    #create and populate tableaus
    @tableau = []
    new_stacks.each_with_index do |stack, i|
      @tableau[i] = Tableau.new(stack)
    end

    #create homecells
    @homecell = []
    4.times {@homecell << Homecell.new}

    #create freecells
    @freecell = []
    4.times {@freecell << Freecell.new}
  end

  def render
    system("clear")
    print "\n\n"
    print " F    R    E    E  ".colorize(:color => :black, :background => :light_white)+
        "  H    O    M    E  \n".colorize(:color => :white, :background => :light_black)
    print " 0f   1f   2f   3f  "+" 0h   1h   2h   3h   \n"
    #freecells
    @freecell.each do |cell|
      if cell.topcard.nil?
        print "[ ] "
      else
        print "#{cell.topcard.inspect} "
      end
      print " "
    end

    #homecells
    @homecell.each do |cell|
      if cell.topcard.nil?
        print "[ ] "
      else
        print "#{cell.topcard.inspect} "
      end
      print " "
    end
    print "\n\n"

    print " 0    1    2    3    4    5    6    7    \n"
    #tableau
    #following 3 lines are compensating for ruby's zip function (different from js,py, etc)
    how_many_rows = @tableau.map(&:stack).map(&:size).max
    nils_to_add = how_many_rows - @tableau[0].stack.size
    first_with_nils = @tableau[0].stack.take(@tableau[0].stack.length) + ([nil] * nils_to_add)

    print_tableaus = first_with_nils.zip(*@tableau[1..-1].map(&:stack))
    print_tableaus.each do |line|
      line.each do |element|
        if element.nil?
          print "     "
        else
          print "#{element.inspect}  "
        end
      end
      print "\n"
    end
    print "\n"

    # how_many_rows = @tableau.map(&:stack).map(&:size).max
    # p how_many_rows
    # @tableau.each do |tab|
    #   tab.stack.each do |el|
    #     print "#{el.inspect}"
    #   end
    #   print "\n"
    # end
  end

  def move(start_pos, end_pos)
    case start_pos[1]
    when :tableau
      start_move = @tableau[start_pos[0]]
    when :freecell
      start_move = @freecell[start_pos[0]]
    when :homecell
      start_move = @homecell[start_pos[0]]
    end

    case end_pos[1]
    when :tableau
      end_move = @tableau[end_pos[0]]
    when :freecell
      end_move = @freecell[end_pos[0]]
    when :homecell
      end_move = @homecell[end_pos[0]]
    end

    end_move.add(start_move.take_one)

  end

  def play_turn
    render
    begin
    move = @player.get_move
    move(move.first, move.last)
    render
    rescue
      retry
    end
  end

  def play_game
    until won?
      play_turn
    end
    p "grats"
  end

  def won?
    won_game = true
    @homecell.each do |home|
      won_game = false unless home.stack.length == 13
    end
    won_game
  end

  private
  def new_stacks
    @deck = Deck.new
    starting_stacks = Array.new(8) {[]}
    counter = 0
    until @deck.empty?
      starting_stacks[counter % 8] << deck.take_one
      counter += 1
    end
    starting_stacks
  end

end

if __FILE__ == $PROGRAM_NAME
  playa = Player.new("michael scarn")
  b = Board.new(playa)
  b.play_game
end

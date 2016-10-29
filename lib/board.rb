require_relative 'card'
require_relative 'deck'
require_relative 'tableau'

class Board
  attr_accessor :deck, :freecell, :tableau, :homecell
  def initialize(deck = nil)
    #create and populate tableaus
    @tableau = []
    new_stacks.each_with_index do |stack, i|
      @tableau[i] = Tableau.new(stack)
    end

    #create homecells
    @homecell = []
    4.times {@homecell << Homecell.new}
  end

  def render
    #freecells
    #homecells


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
    @tableau[end_pos].add(@tableau[start_pos].take_one)
  end

  def get_move
    move = gets.chomp.split(",").map(&:to_i)
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
  b = Board.new
  b.render
  while true
    move = b.get_move
    b.move(move.first, move.last)
    b.render
  end
end

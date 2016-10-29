require_relative 'card'
require_relative 'deck'
require_relative 'tableau'
require_relative 'homecell'

class Board
  attr_accessor :deck, :freecell, :tableau, :home
  def initialize(deck = nil)
    @tableau = []

    new_stacks.each_with_index do |stack, i|
      @tableau[i] = Tableau.new(stack)
    end
    # @tableau = Array.new(8) {Tableau.new}
  end

  def render
    #freecells
    #homecells


    #tableau
    print_tableaus = @tableau[0].stack.zip(*@tableau[1..-1].map(&:stack))
    print_tableaus.each do |line|
      line.each do |element|
        if element.nil?
          print "    "
        else
          print "#{element.inspect}  "
        end
      end
      print "\n"
    end
    print "\n"
  end


  private
  def new_stacks
    @deck = Deck.new
    starting_stacks = Array.new(8) {[]}
    counter = 0
    until @deck.empty?
      starting_stacks[counter % 8] << deck.take
      counter += 1
    end
    starting_stacks
  end

end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.render
end

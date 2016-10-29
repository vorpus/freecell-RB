require 'board'

describe Board do
  let(:player) { double("player") }
  subject(:board) { Board.new(player) }

  it "distributes the deck into tableaus" do
    expect(board.deck.deck.length).to eq(0)
    expect(board.tableau[0].stack.length).to eq(7)
    expect(board.tableau[6].stack.length).to eq(6)
  end
end

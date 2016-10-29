require 'card'

describe Card do
  subject(:card) { Card.new(:spades, :ace) }
  let(:card2) { Card.new(:hearts, :king) }

  it "initialize with parameters as its suit and value" do
    expect(card.suit).to eq(:spades)
    expect(card2.suit).to eq(:hearts)
  end

  it "raises an error when creating an invalid card" do
    expect { Card.new(:blue_eyes_white_dragon, :ace) }.to raise_error("Invalid suit/value.")
  end

  it "has a color associated with its suit" do
    expect(card.color).to eq(:black)
    expect(card2.color).to eq(:red)
  end

  context "#numval" do
    it "reveals the numerical value of itself" do
      expect(card.numval).to eq(1)
      expect(card2.numval).to eq(13)
    end
  end
end

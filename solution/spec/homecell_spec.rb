require 'tableau'
require 'card'

describe Homecell do

  subject(:homecell) { Homecell.new }

  it "inherits from tableau" do
    expect(described_class).to be < Tableau
  end

  context "Adding cards to the home cell" do
    let(:card1) { Card.new(:spades, :ace) }
    let(:card2) { Card.new(:hearts, :deuce) }
    let(:card3) { Card.new(:spades, :deuce) }
    let(:card4) { Card.new(:spades, :three) }

    it "doesn't allow other suits to be added" do
      homecell.add(card1)
      expect { homecell.add(card2) }.to raise_error("Invalid move for home cell")
    end

    it "doesn't allow wrong values to be added" do
      homecell.add(card1)
      expect { homecell.add(card4) }.to raise_error("Invalid move for home cell")
    end

    it "adds cards to the top of its stack" do
      homecell.add(card1)
      homecell.add(card3)
      expect(homecell.topcard).to eq(card3)
      homecell.add(card4)
      expect(homecell.topcard).to eq(card4)
    end
  end
end

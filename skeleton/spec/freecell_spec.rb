require 'tableau'
require 'card'

describe Freecell do

  subject(:freecell) { Freecell.new }

  it "inherits from tableau" do
    expect(described_class).to be < Tableau
  end

  context "Adding cards to the free cell" do
    subject(:card1) { Card.new(:hearts, :three) }
    subject(:card2) { Card.new(:spades, :deuce) }

    it "raises an error when adding a second card" do
      freecell.add(card1)
      expect { freecell.add(card2) }.to raise_error("Freecell can only hold one card at a time.")
    end

    it "adds a card if it's empty" do
      freecell.add(card1)
      expect(freecell.topcard).to eq(card1)
    end
  end
end

require 'tableau'
require 'card'

describe Tableau do
  let(:card1) { Card.new(:spades, :jack) }
  let(:card2) { Card.new(:hearts, :ten) }
  let(:card3) { Card.new(:clubs, :five) }
  subject(:tableau) { Tableau.new([card1,card2,card3]) }
  let(:empty_tableau) { Tableau.new }

  it "can initialize with or without cards" do
    expect(tableau.stack.size).to eq(3)
    expect(Tableau.new.stack.size).to eq(0)
  end

  it "reveals the top card without drawing it" do
    expect(empty_tableau.topcard).to be_nil
    expect(tableau.topcard).to eq(tableau.topcard)
  end

  context "adding cards to tableau" do

    let(:card4) { Card.new(:spades, :four) }
    let(:card5) { Card.new(:hearts, :three) }

    let(:card6) { Card.new(:hearts, :four) }

    it "raises an error when adding a same color card" do
      expect {tableau.add(card4) }.to raise_error("Invalid move")
    end

    it "raises an error when adding a card of wrong value" do
      expect {tableau.add(card5) }.to raise_error("Invalid move")
    end

    it "adds a card to the top of the tableau" do
      tableau.add(card6)
      expect(tableau.topcard).to eq(card6)
    end
  end

  it "removes the top card" do
    expect(tableau.take_one).to eq(card3)
    expect(tableau.take_one).to eq(card2)
  end
end

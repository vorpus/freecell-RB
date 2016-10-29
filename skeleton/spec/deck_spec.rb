require 'byebug'
require 'deck'
require 'card'
require 'colorize'

describe Deck do
  subject(:deck) { Deck.new }
  let (:deck2) { Deck.new }
  it "initializes with fifty-two cards" do
    expect(deck.deck.length).to eq(52)
  end

  it "has unique cards" do
    expect(deck.take_one).to_not eq(deck.take_one)
  end

  it "is shuffled each time it's created" do
    expect(deck.take_one).to_not eq(deck2.take_one)
  end

  it "lets you know when it's empty" do
    expect(deck.empty?).to_not be
    52.times { deck.take_one }
    expect(deck.empty?).to  be
  end
end

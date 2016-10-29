require 'player'

describe Player do
  subject(:player) { Player.new("york peppermint patty") }

  it "turns an input from format '3h' to [3, :homecell]" do
    expect(player.clean_position("3h")).to eq([3, :homecell])
    expect(player.clean_position("0f")).to eq([0, :freecell])
  end

  it "allows players to leave the t off when moving from/to tableau" do
    expect(player.clean_position("4")).to eq([4, :tableau])
  end
end

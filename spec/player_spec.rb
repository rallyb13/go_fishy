require('spec_helper')

describe(Player) do
  it {should have_and_belong_to_many :cards}
  it {should belong_to :game}

  describe "#check_doubles" do
    it "will check a players hand for pairs" do
      player1 = Player.create(score: 0)
      card1 = Card.create(fish: "swordfish")
      card2 = Card.create(fish: "swordfish")
      player1.cards << card1
      player1.cards << card2
      player1.check_doubles
      expect(player1.cards).to eq([])
    end
  end

end

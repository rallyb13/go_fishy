require('spec_helper')

describe(Player) do
  it {should have_and_belong_to_many :cards}
  it {should belong_to :game}
  it {should validate_presence_of :name}

  describe "#check_doubles" do
    it "will check a players hand for pairs" do
      player1 = Player.create(score: 0)
      card1 = Card.create(fish: "swordfish", :dealt => false)
      card2 = Card.create(fish: "swordfish", :dealt => false)
      player1.cards << card1
      player1.cards << card2
      player1.check_doubles
      expect(player1.cards).to eq([])
    end
  end

  describe('#get_card') do
    it('will deal a player a card') do
      card1 = Card.create(fish: "beardfish", dealt: false)
      player1 = Player.create()
      player1.get_card(1)
      expect(player1.cards.first.dealt).to eq(true)
    end
  end

  describe('#ask_for') do
    it('will ask an opponent if they have a certain card') do
      card1 = Card.create(fish: "beardfish")
      card2 = Card.create(fish: "beardfish")
      card3 = Card.create(fish: "jellyfish")
      player1 = Player.create()
      player2 = Player.create()
      player1.cards.push(card1)
      player2.cards.push(card2, card3)
      expect(player1.ask_for(player2, card1.fish)).to eq(true)
    end
    it('will ask an opponent if they have a certain card') do
      card1 = Card.create(fish: "beardfish")
      card2 = Card.create(fish: "beardfish")
      card3 = Card.create(fish: "jellyfish")
      player1 = Player.create()
      player2 = Player.create()
      player1.cards.push(card1)
      player2.cards.push(card2, card3)
      expect(player1.ask_for(player2, card1.fish)).to eq(false)
    end
  end

  describe("#receive_card") do
    it "will add a card to a players hand from the other player" do
      card1 = Card.create(fish: "beardfish")
      card2 = Card.create(fish: "beardfish")
      card3 = Card.create(fish: "jellyfish")
      player1 = Player.create()
      player2 = Player.create()
      player1.cards.push(card1)
      player2.cards.push(card3)
      player2.cards.push(card2)
      player1.ask_for(player2, card2.fish)
      player1.receive_card()
      expect(player1.cards).to eq([card1, card2])
    end
  end

end

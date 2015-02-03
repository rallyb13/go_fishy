require('spec_helper')

describe(Player) do
  it {should have_and_belong_to_many :cards}
  it {should belong_to :game}


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
      player1.ask_for(player2, card1.fish)
      expect(player2.cards()).to eq([card3])
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
      player1.ask_for(player2, card1.fish)
      expect(player1.cards()).to eq([card1, card2])
    end
  end


  # describe "check_doubles" do
  #   player1 = Player.new()
  #   player1.get_cards()
  #   expect(player1.check_doubles()).to eq(true)
  # end
  #

end

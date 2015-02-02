require('spec_helper')

describe(Game) do

  it {should have_many :players}

  describe("#start") do
    it("will deal cards to players") do
      game1 = Game.create()
      Card.add_cards
      player1 = Player.create()
      player2 = Player.create()
      game1.start()
      expect(player1.cards.length).to eq(5)
    end
  end

  describe("#gameover?") do
    it("will check if the game is over") do
      game1 = Game.create()
      player1 = Player.create(score: 0)
      player2 = Player.create(score: 11)
      Card.add_cards
      game1.start()
      expect(game1.gameover?).to eq(true)
    end
  end

  describe("#update_turn") do
    it("will update the db with the correct turn") do
      game1 = Game.create()
      Card.add_cards
      player1 = Player.create()
      player2 = Player.create()
      game1.start()
      game1.update_turn()
      expect(game1.player_id).to eq(player2.id)
    end
  end


end

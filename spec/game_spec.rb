require('spec_helper')

describe(Game) do

  it {should have_many :players}

  describe("#start") do
    it("will start the game and do a lot of fishy stuff") do
      player1 = Player.new()
      player2 = Player.new()
      Game.start()
      expect Game.players.to eq(player1, player2)
    end

    it("will deal cards to players") do
      player1 = Player.new()
      player2 = Player.new()
      Game.start()
      expect player1.cards.length.to eq(5)
    end
  end

  describe("#gameover?") do
    it("will check if the game is over") do
      player1 = Player.new()
      player2 = Player.new()
      Game.start()
      expect Game.gameover?.to eq(false)
    end
  end

  describe("#next_player") do
    it("will call take_turn on the next player") do
      player1 = Player.new()
      player2 = Player.new()
      Game.start()
      expect Game.gameover?.to eq(true)
    end
  end


end

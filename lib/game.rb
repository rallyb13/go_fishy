class Game < ActiveRecord::Base

  has_many :players

  def start
    @players = Player.all
    @total_points = Card.all.length / 2
    @players.each do |player|
      # player.get_cards(5)
    end
    update(:player_id => @players.first.id)
  end

  def gameover?
    total_score = 0
    @players.each do |player|
      total_score += player.score
    end
    if total_score == @total_points
      true
    else
      false
    end
  end

  def update_turn()
    next_player_id = self.player_id + 1
    if next_player_id > @players.last.id
      next_player_id = @players.first.id
    end
    update(player_id: next_player_id)
  end

end

class Game < ActiveRecord::Base

  has_many :players

  def start do
    @players = Player.all
    @num_players = @players.length
    @total_points = Card.all.length / 2

    @players.each do |player|
      player.get_cards(5)
    end

    turn_id = @players.first.player_id
    update(player_id: turn_id)
    Player.find(turn_id).take_turn()
  end

  def gameover? do
    total_score = 0
    @players.each do |player|
      total_score += player.score
    end

    if total_score == @total_points
      true
    else
      false
      next_player(self.player_id)
    end

  end

  def next_player do |current_player_id|
    turn_id = current_player_id + 1
    if turn_id > @num_players
      turn_id = 1
    end
    update(player_id: turn_id)
    Player.find(turn_id).take_turn()
  end

end

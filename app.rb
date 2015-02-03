require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb(:index)
end

post "/game" do
  num_players = params.fetch('num_players').to_i
  if num_players < 1 || num_player > 2
    num_players = 2
  end
  @game = Game.create
  num_players.times {@game.players.create}
  @game.start
  erb(:score)
end

get "/player/:player_id" do
  @player = Player.find(params["player_id"])

  erb(:player)
end

post "/check_doubles" do
  game = Game.first
  player = Player.find(game.player_id)
  player.check_doubles

  redirect back
end

post "/ask" do
  game = Game.first
  player = Player.find(game.player_id)
  opp = params['opp']
  fish = params['fish']
  ask_for(opp, fish)

  redirect back
end


get "/update_turn" do
  update_turn
  @game = Game.first
  erb :score
end

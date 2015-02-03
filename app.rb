require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb(:index)
end

post "/game" do
  num_players = params.fetch('num_players').to_i
  @game = Game.create
  num_players.times {@game.players.create(score: 0)}
  @game.start
  erb(:score)
end

get "/player/:player_id" do
  @player = Player.find(params["player_id"])
  @game = Game.first
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
  opp = Player.find(params['opponent'])
  fish = params['card']
  player.ask_for(opp, fish)

  redirect back
end


get "/update_turn" do
  update_turn
  @game = Game.first
  erb :score
end

get "/reset" do
  Card.all().each() do |x|
    x.destroy()
  end
  Player.all().each() do |x|
    x.destroy()
  end
  Game.all().each() do |x|
    x.destroy()
  end
  redirect "/"
end

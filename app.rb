require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb(:index)
end

post "/game" do
  @game = Game.create
  @game.players.create(params['name1'])
  @game.players.create(params['name2'])
  @game.players.create(params['name3'])
  @game.players.create(params['name4'])
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

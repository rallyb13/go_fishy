require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb(:index)
end

post "/game" do
  @game = Game.create
  if params['name1'] != ""
    @game.players.create(name: params['name1'], player_num: 1, score: 0)
  end
  if params['name2'] != ""
    @game.players.create(name: params['name2'], player_num: 2, score: 0)
  end
  if params['name3'] != ""
    @game.players.create(name: params['name3'], player_num: 3, score: 0)
  end
  if params['name4'] != ""
    @game.players.create(name: params['name4'], player_num: 4, score: 0)
  end
  @game.start
  erb(:score)
end

get "/player/:player_num" do
  @player = Player.find_by(player_num: params["player_num"])
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


post "/update_turn" do
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

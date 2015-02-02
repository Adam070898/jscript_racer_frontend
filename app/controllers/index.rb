enable 'sessions'
get '/' do
  erb :index
end

post '/start' do
  if Player.where(name: params[:player1]) == []
    @p1 = Player.create(name: params[:player1])
  else
    @p1 = Player.where(name: params[:player1]).first
  end
  if Player.where(name: params[:player2]) == []
    @p2 = Player.create(name: params[:player2])
  else
    @p2 = Player.where(name: params[:player2]).first
  end
  session[:player1] = @p1.id
  session[:player2] = @p2.id
  session[:start] = Time.now
  erb :race
end

get '/p1win' do
  session[:end] = Time.now
  session[:time] = session[:end] - session[:start]
  puts "P1 wins!"
  @p1win = Game.create(score: session[:time], win: true)
  PlayersGame.create(game_id: @p1win.id, player_id: session[:player1] )
  @p2
  erb :p1win
end

get '/p2win' do
  session[:end] = Time.now
  byebug
  session[:time] = session[:end] - session[:start]
  puts "P2 wins!"
  @p2win = Game.create(score: session[:time], win: true)
  PlayersGame.create(game_id: @p2win.id, player_id: session[:player2])
  erb :p2win
end

post '/score' do
  @player = Player.where(name: params[:playername]).first
  @games = @player.games.order(:score)
  erb :score
end

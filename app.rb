require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  set :session_secret, "super-secret"
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    @player1 = Player.new(params[:player1])
    @player2 = Player.new(params[:player2])
    $game = Game.new(@player1, @player2)
    redirect to '/play'
  end

  get '/play' do
    @player1 = $game.player1
    @player2 = $game.player2
    erb :play
  end

  get '/attack' do
    @player1 = $game.player1
    @player2 = $game.player2
    $game.attack(@player2)
    erb :attack
    redirect '/play'
  end

  get '/switch' do
    $game.switch
    redirect '/play'
  end
end

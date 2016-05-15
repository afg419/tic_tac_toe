class GamesController < ApplicationController
  def show
    @player = session[:player]
  end

  def update
    session[:player] = params[:player]
    redirect_to game_path(1)
  end
end

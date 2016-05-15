class GamesController < ApplicationController
  def show
    @player = session[:game]["player"]
    @game = Game.find(session[:game]["game_id"])
  end

  def update
    player = params[:player]
    g = Game.find_or_create_by(title: "MVP Game")
    session[:game] = {game_id: g.id, player: player}
    g.update_attributes(player => true, current_player: "x")
    redirect_to game_path(g.id)
  end
end

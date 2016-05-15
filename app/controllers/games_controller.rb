class GamesController < ApplicationController
  def show
    @player = session[:game]["player"]
    @game = Game.find(session[:game]["game_id"])
    gwc = GameWinChecker.new(@game.board)
    @winning_player = gwc.win? || gwc.draw?
  end

  def update
    player = params[:player]
    g = Game.find_or_create_by(title: "MVP Game")
    session[:game] = {game_id: g.id, player: player}
    g.update_attributes(player => true)
    redirect_to game_path(g.id)
  end

  def destroy
    current_game.destroy if current_game
    session[:game] = {}

    redirect_to root_path
  end
end

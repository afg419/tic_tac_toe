class Api::V1::GamesController < ApplicationController

  def update
    game = Game.find(params["id"].to_i)
    pos = params["new_move"]["pos"].map(&:to_i)
    player = params["new_move"]["player"]
    if game && game.current_player == player && game.board[pos[0]][pos[1]] == "empty"
      game.board[pos[0]][pos[1]] = player
      game.current_player = other_player(game.current_player)
      game.save
      gwc = GameWinChecker.new(game.board)
      winning_player = gwc.win? || gwc.draw?
      render json: {game: game, winning_player: winning_player}
    else
      render json: {error: "no game, not your turn, or that spot's been taken already"}
    end
  end
end

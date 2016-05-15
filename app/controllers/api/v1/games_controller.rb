class Api::V1::GamesController < ApplicationController

  def update
    game = current_game
    player = current_player
    pos = params["new_move"]["pos"].map(&:to_i)
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

  def show
    gwc = GameWinChecker.new(current_game.board)
    winning_player = gwc.win? || gwc.draw?

    render json: {game: current_game, winning_player: winning_player}
  end
end

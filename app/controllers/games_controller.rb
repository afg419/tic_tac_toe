class GamesController < ApplicationController
  def show

  end

  def update
    redirect_to game_path(1)
  end
end

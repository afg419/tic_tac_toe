class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :other_player

  def other_player(player)
    (["x", "o"] - [player])[0]
  end
end

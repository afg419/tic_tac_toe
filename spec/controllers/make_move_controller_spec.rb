require 'rails_helper'

RSpec.describe Api::V1::GamesController, type: :controller do
  it "player makes a move" do
    game = Game.create(x: true, current_player: "x")
    move_params = {"new_move" => {"pos"=>["1", "1"], "player"=>"x"}, "id" => game.id}

    patch :update, move_params

    reply = JSON.parse(response.body)
    game.reload

    expect(response.status).to eq 200
    expect(reply["board"][1][1]).to eq "x"
    expect(game.board[1][1]).to eq "x"
  end

  it "changes players after move" do
    game = Game.create(x: true, current_player: "x")
    move_params = {"new_move" => {"pos"=>["1", "1"], "player"=>"x"}, "id" => game.id}

    patch :update, move_params

    reply = JSON.parse(response.body)
    game.reload

    expect(reply["current_player"]).to eq "o"
    expect(game.current_player).to eq "o"
  end

  it "wont move if not players turn" do
    game = Game.create(x: true, current_player: "x")
    move_params = {"new_move" => {"pos"=>["1", "1"], "player"=>"o"}, "id" => game.id}

    patch :update, move_params

    reply = JSON.parse(response.body)
    game.reload

    expect(reply["error"]).to eq "no game, not your turn, or that spot's been taken already"
    expect(game.current_player).to eq "x"
    expect(game.board[1][1]).to eq "empty"
  end

  it "wont move if space not empty" do
    board = [["empty", "empty" , "empty"],
             ["empty", "o","empty"],
             ["empty", "empty", "empty"]]
    game = Game.create(x: true, current_player: "x", board: board)

    move_params = {"new_move" => {"pos"=>["1", "1"], "player"=>"x"}, "id" => game.id}

    patch :update, move_params

    reply = JSON.parse(response.body)
    game.reload

    expect(reply["error"]).to eq "no game, not your turn, or that spot's been taken already"
    expect(game.current_player).to eq "x"
    expect(game.board[1][1]).to eq "o"
  end

end

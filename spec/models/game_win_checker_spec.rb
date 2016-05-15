require 'rails_helper'

RSpec.describe GameWinChecker, type: :model do
  it "return winning player for a 3some array" do
    board = []
    gwc = GameWinChecker.new(board)

    expect(gwc.winning_array?(["empty", "empty", "empty"])).to eq nil
    expect(gwc.winning_array?(["empty", "x", "empty"])).to eq nil
    expect(gwc.winning_array?(["x", "x", "x"])).to eq "x"
  end

  it "checks rows for win" do
    empty_board = [["empty", "empty", "empty"], ["empty", "empty", "empty"], ["empty", "empty", "empty"]]
    gwc = GameWinChecker.new(empty_board)
    expect(gwc.check_rows_for_win).to eq [nil, nil, nil]

    winning_row_board = [["x", "o", "empty"], ["o", "o", "o"], ["x", "x", "empty"]]
    gwc = GameWinChecker.new(winning_row_board)
    expect(gwc.check_rows_for_win).to eq [nil, "o", nil]
  end

  it "checks rows for win" do
    empty_board = [["empty", "empty", "empty"], ["empty", "empty", "empty"], ["empty", "empty", "empty"]]
    gwc = GameWinChecker.new(empty_board)
    expect(gwc.check_columns_for_win).to eq [nil, nil, nil]

    winning_column_board = [["x", "o", "empty"], ["x", "o", "o"], ["x", "x", "x"]]
    gwc = GameWinChecker.new(winning_column_board)
    expect(gwc.check_columns_for_win).to eq ["x", nil, nil]
  end

  it "checks diagonals for win" do
    empty_board = [["empty", "empty", "empty"], ["empty", "empty", "empty"], ["empty", "empty", "empty"]]
    gwc = GameWinChecker.new(empty_board)
    expect(gwc.check_diagonals_for_win).to eq [nil, nil]

    winning_pos_diag_board = [["x", "o", "empty"], ["o", "x", "o"], ["x", "x", "x"]]
    gwc = GameWinChecker.new(winning_pos_diag_board)
    expect(gwc.check_diagonals_for_win).to eq ["x", nil]

    winning_neg_diag_board = [["x", "o", "o"], ["o", "o", "o"], ["o", "x", "x"]]
    gwc = GameWinChecker.new(winning_neg_diag_board)
    expect(gwc.check_diagonals_for_win).to eq [nil, "o"]
  end

  it "detects a winning player" do
    empty_board = [["empty", "empty", "empty"], ["empty", "empty", "empty"], ["empty", "empty", "empty"]]
    gwc = GameWinChecker.new(empty_board)

    expect(gwc.win?).to eq nil

    winning_pos_diag_board = [["x", "o", "empty"], ["o", "x", "o"], ["x", "x", "x"]]
    gwc = GameWinChecker.new(winning_pos_diag_board)
    expect(gwc.win?).to eq "x"

    winning_row_board = [["x", "o", "empty"], ["o", "o", "o"], ["x", "x", "empty"]]
    gwc = GameWinChecker.new(winning_row_board)
    expect(gwc.win?).to eq "o"
  end
end

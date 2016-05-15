class GameWinChecker

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def check_columns_for_win
    board.each_index.map do |i|
      winning_array?(board.transpose[i])
    end
  end

  def check_rows_for_win
    board.each_index.map do |i|
      winning_array?(board[i])
    end
  end

  def check_diagonals_for_win
    pos_diag = (0..2).map do |i|
      board[i][i]
    end

    neg_diag = (0..2).map do |i|
      board[i][2-i]
    end

    [winning_array?(pos_diag), winning_array?(neg_diag)]
  end

  def win?
    [check_diagonals_for_win, check_rows_for_win, check_columns_for_win].flatten.compact[0]
  end

  def draw?
    if !board.flatten.include?("empty")
      "draw"
    end
  end

  def winning_array?(array)
    if array[0] === array[1] && array[1] == array[2] && array[2] != "empty"
      array[2]
    end
  end
end

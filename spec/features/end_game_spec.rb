require 'rails_helper'

RSpec.feature "Game ends", type: :feature do
  scenario "player x wins", js: true do
    won_game = [["x", "x", "x"], ["empty", "empty", "empty"], ["empty", "empty", "empty"]]
    g = Game.create(board: won_game)
    visit root_path
    click_on "Join as X's"

    expect(page).to have_content("Player X has won! Play again?")
  end

  scenario "player o wins", js: true do
    won_game = [["o", "o", "o"], ["empty", "empty", "empty"], ["empty", "empty", "empty"]]
    g = Game.create(board: won_game)
    visit root_path
    click_on "Join as X's"

    expect(page).to have_content("Player O has won! Play again?")
  end

  scenario "game is draw", js: true do
    draw_game = [["o", "x", "o"],
                 ["x", "o", "o"],
                 ["x", "o", "x"]]
    g = Game.create(board: draw_game)
    visit root_path
    click_on "Join as X's"

    expect(page).to have_content("Game is a draw! Play again?")
  end


  scenario "replay game", js: true do
    draw_game = [["o", "x", "o"],
                 ["x", "o", "o"],
                 ["x", "o", "x"]]
    g = Game.create(board: draw_game)
    visit root_path
    click_on "Join as X's"
    click_on "Play again?"

    expect(Game.count).to eq 0
    expect(current_path).to eq root_path
  end
end

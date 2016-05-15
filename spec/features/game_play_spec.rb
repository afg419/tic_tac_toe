require 'rails_helper'

RSpec.feature "Game board and functionality", type: :feature do
  scenario "root has join buttons", js: true do
    visit root_path
    click_on "Join as X's"
    expect(current_path).to eq '/games/1'
    # expect(page).to have_css "game-board"
    expect(page).to have_content "00"
    expect(page).to have_content "01"
    expect(page).to have_content "02"
    expect(page).to have_content "10"
    expect(page).to have_content "11"
    expect(page).to have_content "12"
    expect(page).to have_content "20"
    expect(page).to have_content "21"
    expect(page).to have_content "22"
  end
end

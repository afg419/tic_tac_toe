require 'rails_helper'

RSpec.feature "Game board and functionality", type: :feature do
  scenario "root has join buttons", js: true do
    visit root_path
    click_on "Join as X's"
    g = Game.first
    expect(current_path).to eq "/games/#{g.id}"
    expect(page).to have_css ".cell-00"
    expect(page).to have_css ".cell-01"
    expect(page).to have_css ".cell-02"
    expect(page).to have_css ".cell-10"
    expect(page).to have_css ".cell-11"
    expect(page).to have_css ".cell-12"
    expect(page).to have_css ".cell-20"
    expect(page).to have_css ".cell-21"
    expect(page).to have_css ".cell-22"
  end

  scenario "root has join buttons", js: true do
    visit root_path
    click_on "Join as X's"
    within(".cell-00") do
      expect(page).to have_css ".make-move"
      click_on "x"
      expect(page).to_not have_css ".make-move"
      expect(page).to have_css ".move"
    end
  end
end

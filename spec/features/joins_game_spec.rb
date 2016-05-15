require 'rails_helper'

RSpec.feature "Joins game from root", type: :feature do
  scenario "root has join buttons", js: true do
    visit root_path
    expect(page).to have_content("Join as X's")
    expect(page).to have_content("Join as O's")
  end

  scenario "joins as X's", js: true do
    visit root_path
    click_on "Join as X's"
    expect(page).to have_content("Playing as X's")
    expect(page).to have_content("Waiting on O's player")
  end

  scenario "joins as O's", js: true do
    visit root_path
    click_on "Join as O's"
    expect(page).to have_content("Playing as O's")
    expect(page).to have_content("Waiting on X's player")
  end
end

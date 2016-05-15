require 'rails_helper'

RSpec.feature "Joins game from root", type: :feature do
  scenario "root has join buttons", js: true do
    visit root_path
    expect(page).to have_content("Join as X's")
    expect(page).to have_content("Join as O's")
  end
end

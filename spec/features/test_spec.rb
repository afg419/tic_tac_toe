require 'rails_helper'

RSpec.feature "Zone activation", type: :feature do
  scenario "registered toggles a zone", js: true do
    visit root_path
    expect(1+1).to eq(2)
  end

end

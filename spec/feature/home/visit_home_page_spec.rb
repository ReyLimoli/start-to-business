require 'rails_helper'

feature 'visit home page and see page details' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'Start to Business')
  end
end

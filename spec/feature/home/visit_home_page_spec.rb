require 'rails_helper'

feature 'visit home page and see page details' do
  scenario 'successfully' do
    msg = "Onde você pode investir \
em uma ideia e criar a sua!"

    visit root_path

    expect(page).to have_css('h1', text: 'Bem-vindo ao S2Business')
    expect(page).to have_css('p', text: msg)
  end
end

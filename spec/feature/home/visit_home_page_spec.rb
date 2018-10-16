require 'rails_helper'

feature 'visit home page and see page details' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'Bem-vindo ao S2Business')
    expect(page).to have_css('p', text: "Onde você pode investir em \
uma ideia e criar a sua!")
  end
end

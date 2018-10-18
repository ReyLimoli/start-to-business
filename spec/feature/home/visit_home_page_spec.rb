require 'rails_helper'

feature 'visit home page and see page details' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'Start to Business')
    expect(page).to have_css('p', text: "Encontre investidores \
dispostos a firmar parceria.")
  end

  scenario 'successfully' do
    investor = User.create!(name: 'Aparecida', email: 'user1234@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: 10 / 0o5 / 2016,
                        amount_available_to_invest: '600')
    visit root_path

    click_on 'Logar'
    fill_in 'Email', with: investor.email
    fill_in 'Senha', with: investor.password
    click_on 'Entrar'

    expect(page).not_to have_content('Minhas ideias')
    expect(page).not_to have_content('Tenho uma ideia')
  end
end

require 'rails_helper'

feature 'idealizer login' do
  scenario 'successfully' do
    user = User.create!(name: 'Aparecida', email: 'user@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: 10 / 0o5 / 2016)

    visit root_path
    click_on 'Logar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    expect(page).to have_content('Login efetuado com sucesso!')
    expect(page).not_to have_content('Logar')
    expect(page).to have_content('Logout')
  end

  scenario 'login and see link to my ideias' do
    user = User.create!(name: 'Aparecida', email: 'user@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: 10 / 0o5 / 2016)

    visit root_path
    click_on 'Logar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    expect(page).to have_content('Minhas ideias')
  end
end

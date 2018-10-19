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
    expect(current_path).to eq ideas_path
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

  scenario 'force access to root path' do
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
    visit root_path
    expect(current_path).to eq ideas_path
  end
end

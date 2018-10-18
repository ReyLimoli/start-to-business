require 'rails_helper'

feature 'user know investor to indicate' do
  scenario 'successfully' do
    user = User.create!(name: 'Aparecida', email: 'user2@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: '2016-05-10')

    visit root_path
    click_on 'Logar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'
    click_on 'Indique um investidor'

    fill_in 'Nome', with: 'Reynaldo'
    fill_in 'Email', with: 'reynaldo@rey.com'
    fill_in 'Linkedin', with: 'reydoinvestimento'
    click_on 'Enviar'

    expect(page).to have_content("Obrigado por indicar um investidor \
para nossa plataforma")
    expect(page).to have_content('Investidor indicado: Reynaldo')
    expect(page).to have_content('Email: reynaldo@rey.com')
    expect(page).to have_content('Linkedin: reydoinvestimento')
  end

  scenario 'and must fill_in all fields' do
    user = User.create!(name: 'Aparecida', email: 'user2@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: '2016-05-10')

    visit root_path
    click_on 'Logar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'
    click_on 'Indique um investidor'

    fill_in 'Nome', with: ''
    fill_in 'Email', with: ''
    fill_in 'Linkedin', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Linkedin não pode ficar em branco')
    expect(page).to have_content('Email não pode ficar em branco')
  end

  scenario 'must be logged_in' do
    visit new_invite_path

    expect(current_path).to eq new_user_session_path
  end

  scenario 'and must insert a valid email' do
    user = User.create!(name: 'Aparecida', email: 'user2@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: '2016-05-10')

    visit root_path
    click_on 'Logar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'
    click_on 'Indique um investidor'

    fill_in 'Nome', with: 'Joao'
    fill_in 'Email', with: 'joao'
    fill_in 'Linkedin', with: 'http://linkedin.com/joao'
    click_on 'Enviar'

    expect(page).to have_content('Email inválido')
  end
end

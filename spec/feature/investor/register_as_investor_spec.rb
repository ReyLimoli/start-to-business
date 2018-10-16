require 'rails_helper'

feature 'visitor register as an investor' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cadastre-se'
    choose 'Investidor'

    fill_in 'Nome', with: 'Carla Crude'
    fill_in 'Documento', with: '9837927389'
    fill_in 'Linkedin', with: 'linkedin'
    fill_in 'Data de Nascimento', with: '05/10/2017'
    fill_in 'Valor disponível para investir', with: '6000'
    fill_in 'Email', with: 'teste@teste.com'
    fill_in 'Senha', with: 'teste123**'
    fill_in 'Confirme sua senha', with: 'teste123**'
    click_on 'Cadastrar'

    expect(page).to have_content('Cadastro efetuado com sucesso.')
  end

  scenario 'not register with blank fields' do
    visit root_path
    click_on 'Cadastre-se'
    choose 'Investidor'
    fill_in 'Nome', with: ''
    fill_in 'Documento', with: ''
    fill_in 'Linkedin', with: ''
    fill_in 'Data de Nascimento', with: ''
    fill_in 'Valor disponível para investir', with: ''
    fill_in 'Email', with: ''
    fill_in 'Senha', with: ''
    fill_in 'Confirme sua senha', with: 'teste123**'
    click_on 'Cadastrar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Documento não pode ficar em branco')
    expect(page).to have_content('Linkedin não pode ficar em branco')
    expect(page).to have_content('Data de Nascimento não pode ficar em branco')
    expect(page).to have_content('Valor disponível para investir não pode'\
                                ' ficar em branco')
    expect(page).to have_content('Email não pode ficar em branco')
    expect(page).to have_content('Senha não pode ficar em branco')
  end
end

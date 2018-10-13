require 'rails_helper'

feature 'visitor register as an investor' do
    scenario 'successfully' do
    
    visit root_path
    click_on 'Cadastrar como investidor'
    fill_in 'Nome', with: 'Carla Crude'
    fill_in 'Documento', with: '9837927389'
    fill_in 'Linkedin', with: 'linkedin' 
    fill_in 'Data de Nascimento', with: '05-10-2018'
    fill_in 'Valor disponível para investir', with: '6000'
    fill_in 'Email', with: 'teste@teste.com'
    fill_in 'Senha', with: 'teste123**'
    fill_in 'Confirme sua senha', with: 'teste123**'
    click_on 'Cadastrar'
  
    expect(page).to have_content('Cadastro efetuado com sucesso.')
    end
end

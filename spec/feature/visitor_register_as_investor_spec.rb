require 'rails_helper'

feature 'visitor register as an investor' do
    scenario 'successfully' do
    
    visit root_pah
    click_on 'Cadastrar como investidor'

    fill_in 'Nome', with: 'Carla Crude', 
    fill_in 'Documento', with: '9837927389', 
    fill_in 'Email', with: 'teste@teste.com'
    fill_in 'Senha', with: 'teste123'
    fill_in 'Linkedin', with: 'linkedin', 
    fill_in 'Data de Nascimento', with: '10-05-1999', 
    fill_in 'Investimento disponível', with: '600,00'

    expect(page).to have_css('h1', text: 'Investidor cadastrado com sucesso')
    end
end

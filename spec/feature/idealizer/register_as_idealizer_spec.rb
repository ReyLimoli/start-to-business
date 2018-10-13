require 'rails_helper'

feature 'visitor register as an idealizer' do
    scenario 'successfully' do
    
        visit root_path
        click_on 'Cadastre-se'

        choose 'Idealizador'
        
        fill_in 'Nome', with: 'Carla Crude'
        fill_in 'Documento', with: '9837927389'
        fill_in 'Linkedin', with: 'linkedin' 
        fill_in 'Data de Nascimento', with: '05/10/2017'
        fill_in 'Email', with: 'teste@teste.com'
        fill_in 'Senha', with: 'teste123**'
        fill_in 'Confirme sua senha', with: 'teste123**'
        click_on 'Cadastrar'
  
        expect(page).to have_content('Cadastro efetuado com sucesso.')
    end
end
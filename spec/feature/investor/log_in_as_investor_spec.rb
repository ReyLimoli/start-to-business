require 'rails_helper'

feature 'investor login' do
    scenario 'successfully' do
        user = User.create!(name: 'Aparecida', email: 'user1234@user.com', 
                            password:'123456', document: 123456, 
                            linkedin: 'linkedin', birth_day: 10/05/2016, 
                            amount_available_to_invest: '600')

        visit root_path
        click_on 'Logar'
        fill_in 'Email', with: user.email
        fill_in 'Senha', with: user.password
        click_on 'Entrar'

        expect(page).to have_content('Login efetuado com sucesso!')
        expect(page).not_to have_content('Logar')
        expect(page).to have_content('Logout')
    end
end
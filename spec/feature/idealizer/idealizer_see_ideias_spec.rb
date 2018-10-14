require 'rails_helper'

feature 'idealizer see his own ideias' do
    
    scenario 'successfully' do 
        user = User.create(email: 'user@user.com', password:'123456', document: 123456, linkedin: 'linkedin', birth_day: 10/05/2016)
        ideia = Idea.create!(title: 'Suporte de gealdeira', 
                             description: 'A melhor invenção', 
                             estimated_project_time: 1, 
                             initial_investment_value: 400, 
                             estimated_time_to_profit: 1,
                             user: user)

        visit root_path
        click_on 'Login Idealizador'
        fill_in 'Email', with: user.email
        fill_in 'Senha', with: user.password
        click_on 'Entrar'
        click_on 'Ver minhas ideias'

        expect(page).to have_css('h1', text: 'Suporte de gealdeira')
        expect(page).to have_css('h1', text: 'A melhor invenção')

    end
end
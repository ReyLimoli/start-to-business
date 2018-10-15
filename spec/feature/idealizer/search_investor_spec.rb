require 'rails_helper'

feature 'idealizer search investor' do
  scenario 'successfully' do
    
    user_idealizer = User.create!(name: 'Aparecida', email: 'aparecida@aparecida.com', 
        password:'123456', document: 123456, 
        linkedin: 'linkedin', birth_day: 10/05/2016)

    user_investor = User.create!(name: 'Augusto', email: 'augusto@augusto.com', 
                password:'123456', document: 123456, 
                linkedin: 'linkedin', birth_day: 10/05/2016, 
                amount_available_to_invest: '600')

    suporte = Idea.create!(title: 'Suporte de geladeira', 
                            description: 'A melhor invenção', 
                            estimated_project_time: 2, 
                            initial_investment_value: 400, 
                            estimated_time_to_profit: 10,
                            user: user_idealizer)

    visit root_path
    
   click_on 'Encontre um investidor'
   
    expect(page).to have_content('Investidores')
    expect(page).to have_css('h5', text: 'Augusto')
    expect(page).to have_css('li', text: 'augusto@augusto.com')
    expect(page).to have_css('li', text: '600')
  end
end

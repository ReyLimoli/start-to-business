require 'rails_helper'

feature 'Investor_view_all_ideas' do 
  scenario 'successfully' do
    idea = create(:idea, title: 'Invenção da roda', description: 'Nova forma de utilizar a roda',
                       estimated_project_time: 3, initial_investment_value: 10000.00,
                       estimated_time_to_profit: 24 )
    idea2 = create(:idea, title: 'Invenção da Lampada', description: 'Ilumine o mundo ao seu redor',
                        estimated_project_time: 4, initial_investment_value: 3000.00,
                        estimated_time_to_profit: 12 )


    visit root_path

    expect(page).to have_css('h1', text: 'Invenção da roda')
    expect(page).to have_css('p', text: 'Nova forma de utilizar...')

    expect(page).to have_css('h1', text: 'Invenção da Lampada')
    expect(page).to have_css('p', text: 'Ilumine o mundo ao seu...')
  end

  scenario 'Investor view idea details' do
    idea = create(:idea, title: 'Invenção da roda', description: 'Nova forma de utilizar a roda',
                  estimated_project_time: 3, initial_investment_value: 10000.00,
                  estimated_time_to_profit: 24 )
                
    visit root_path
    
    within "#idea-#{idea.id}" do
      click_on 'Ver detalhes'
    end
    expect(current_path).to eq idea_path(idea.id)
    expect(page).to have_css('h1', text: 'Invenção da roda')
    expect(page).to have_css('p', text: 'Nova forma de utilizar a roda')
    expect(page).to have_css('p', text: '3 meses')
    expect(page).to have_css('p', text: 'R$ 10000,00')
    expect(page).to have_css('p', text: '24 meses')
  end

end
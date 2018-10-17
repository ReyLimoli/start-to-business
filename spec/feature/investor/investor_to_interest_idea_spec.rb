require 'rails_helper'

feature 'Investor_to_interest_idea' do
  scenario 'successfully' do
    user = User.create!(name: 'Aparecida', email: 'user1234@user.com',
                            password: '123456', document: 123_456,
                            linkedin: 'linkedin', birth_day: 10 / 0o5 / 2016,
                            amount_available_to_invest: '600')
    idea = create(:idea, title: 'Invenção da roda',
                  description: 'Nova forma de utilizar a roda',
                  estimated_project_time: 3,
                  initial_investment_value: 10_000.00,
                  estimated_time_to_profit: 24, user: user)

    visit root_path

    click_on 'Logar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    within "#idea-#{idea.id}" do
      click_on 'Ver detalhes'
    end
    
    find('.favorite-button').click
  
    favorite = FavoriteIdea.last
    expect(favorite.user).to eq user
    expect(favorite.idea).to eq idea
    expect(current_path).to eq(idea_path(idea))
    expect(page).not_to have_css('.favorite-button')
    expect(page).to have_css('.unfavorite-button')
    end

    scenario 'Investor unfavorite idea' do
      user = User.create!(name: 'Aparecida', email: 'user1234@user.com',
                                             password: '123456', document: 123_456,
                                             linkedin: 'linkedin', birth_day: 10 / 0o5 / 2016,
                                             amount_available_to_invest: '600')

      idea = create(:idea, title: 'Invenção da roda',
                           description: 'Nova forma de utilizar a roda',
                           estimated_project_time: 3,
                           initial_investment_value: 10_000.00,
                           estimated_time_to_profit: 24, user: user)
      favorite = FavoriteIdea.create(user: user, idea: idea)

      visit root_path

      click_on 'Logar'
      fill_in 'Email', with: user.email
      fill_in 'Senha', with: user.password
      click_on 'Entrar'
  
      within "#idea-#{idea.id}" do
        click_on 'Ver detalhes'
      end
      
      find('.unfavorite-button').click
    
      favorite = FavoriteIdea.last
      expect(favorite.user).to eq user
      expect(favorite.idea).to eq idea
      expect(favorite.active?).to eq false
      expect(current_path).to eq(idea_path(idea))
      expect(page).to have_css('.favorite-button')
      expect(page).not_to have_css('.unfavorite-button')

    end
  end
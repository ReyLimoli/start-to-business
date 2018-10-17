require 'rails_helper'

feature 'Investor_view_all_ideas' do
  scenario 'successfully' do
    investor = User.create!(name: 'Aparecida', email: 'user123456@user.com',
                            password: '123456', document: 123_456,
                            linkedin: 'linkedin', birth_day: 10 / 0o5 / 2016,
                            amount_available_to_invest: '600')
    user = User.create!(name: 'Aparecida', email: 'user2@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: 10 / 0o5 / 2016)
    create(:idea, title: 'Invenção da roda',
                  description: 'Nova forma de utilizar a roda',
                  estimated_project_time: 3,
                  initial_investment_value: 10_000.00,
                  estimated_time_to_profit: 24, user: user)
    create(:idea, title: 'Invenção da Lampada',
                  description: 'Ilumine o mundo ao seu redor',
                  estimated_project_time: 4,
                  initial_investment_value: 3000.00,
                  estimated_time_to_profit: 12, user: user)

    visit root_path

    click_on 'Logar'
    fill_in 'Email', with: investor.email
    fill_in 'Senha', with: investor.password
    click_on 'Entrar'

    expect(page).to have_css('h1', text: 'Invenção da roda')
    expect(page).to have_css('p', text: 'Nova forma de utilizar...')

    expect(page).to have_css('h1', text: 'Invenção da Lampada')
    expect(page).to have_css('p', text: 'Ilumine o mundo ao seu...')
  end

  scenario 'Investor view idea details' do
    investor = User.create!(name: 'Aparecida', email: 'user1234@user.com',
                            password: '123456', document: 123_456,
                            linkedin: 'linkedin', birth_day: 10 / 0o5 / 2016,
                            amount_available_to_invest: '600')
    user = User.create!(name: 'Aparecida', email: 'user2@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: 10 / 0o5 / 2016)
    idea = create(:idea, title: 'Invenção da roda',
                         description: 'Nova forma de utilizar a roda',
                         estimated_project_time: 3,
                         initial_investment_value: 10_000.00,
                         estimated_time_to_profit: 24, user: user)

    visit root_path

    click_on 'Logar'
    fill_in 'Email', with: investor.email
    fill_in 'Senha', with: investor.password
    click_on 'Entrar'

    within "#idea-#{idea.id}" do
      click_on 'Ver detalhes'
    end
    expect(current_path).to eq idea_path(idea.id)
    expect(page).to have_css('h5', text: 'Invenção da roda')
    expect(page).to have_css('p', text: 'Nova forma de utilizar a roda')
    expect(page).to have_css('li', text: '3 meses')
    expect(page).to have_css('li', text: 'R$ 10.000,00')
    expect(page).to have_css('li', text: '24 meses')
  end

  scenario 'cannot see ideas unless is signed in' do
    user = User.create!(name: 'Aparecida', email: 'user2@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: 10 / 0o5 / 2016)
    create(:idea, title: 'Invenção da roda',
                  description: 'Nova forma de utilizar a roda',
                  estimated_project_time: 3,
                  initial_investment_value: 10_000.00,
                  estimated_time_to_profit: 24, user: user)

    visit root_path

    expect(page).not_to have_css('h1', text: 'Invenção da roda')
  end
end

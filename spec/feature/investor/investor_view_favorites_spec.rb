require 'rails_helper'

feature 'investor view favorites ideas' do
  scenario 'successfully' do
    user = User.create!(name: 'Aparecida', email: 'user1234@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: '2016-05-10',
                        amount_available_to_invest: '600')
    idea = create(:idea, title: 'Invenção da roda',
                         description: 'Nova forma de utilizar a roda',
                         estimated_project_time: 3,
                         initial_investment_value: 10_000.00,
                         estimated_time_to_profit: 24, user: user)
    idea2 = create(:idea, title: 'Invenção da Lampada',
                          description: 'Nova forma de utilizar a lampada',
                          estimated_project_time: 4,
                          initial_investment_value: 10_000.00,
                          estimated_time_to_profit: 24, user: user)

    investor = User.create(name: 'Batata', email: 'investor@user.com',
                           password: '123456', document: 123_456,
                           linkedin: 'linkedin', birth_day: '2016-05-10',
                           amount_available_to_invest: '500')

    FavoriteIdea.create(user: investor, idea: idea)

    visit root_path

    click_on 'Logar'
    fill_in 'Email', with: investor.email
    fill_in 'Senha', with: investor.password
    click_on 'Entrar'
    click_on 'Favoritas'

    expect(page).to have_css('h1', text: 'Ideias Favoritas')
    expect(page).to have_content('Invenção da roda')
    expect(page).to have_content('Nova forma de utilizar a roda')
    expect(page).to have_link('Ver detalhes', href: idea_path(idea))

    expect(page).not_to have_content('Invenção da Lampada')
    expect(page).not_to have_content('Nova forma de utilizar a lampada')
    expect(page).not_to have_link('Ver detalhes', href: idea_path(idea2))
  end

  scenario 'investor not has a favorite idea' do
    user = User.create!(name: 'Aparecida', email: 'user1234@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: '2016-05-10',
                        amount_available_to_invest: '600')
    idea = create(:idea, title: 'Invenção da roda',
                         description: 'Nova forma de utilizar a roda',
                         estimated_project_time: 3,
                         initial_investment_value: 10_000.00,
                         estimated_time_to_profit: 24, user: user)
    idea2 = create(:idea, title: 'Invenção da Lampada',
                          description: 'Nova forma de utilizar a lampada',
                          estimated_project_time: 4,
                          initial_investment_value: 10_000.00,
                          estimated_time_to_profit: 24, user: user)

    investor = User.create(name: 'Batata', email: 'investor@user.com',
                           password: '123456', document: 123_456,
                           linkedin: 'linkedin', birth_day: '2016-05-10',
                           amount_available_to_invest: '500')

    visit root_path

    click_on 'Logar'
    fill_in 'Email', with: investor.email
    fill_in 'Senha', with: investor.password
    click_on 'Entrar'
    click_on 'Favoritas'

    expect(page).to have_content('Você ainda não possui nenhuma ideia favorita')
    expect(page).to have_css('h1', text: 'Ideias Favoritas')
    expect(page).not_to have_content('Invenção da roda')
    expect(page).not_to have_content('Nova forma de utilizar a roda')
    expect(page).not_to have_link('Ver detalhes', href: idea_path(idea))

    expect(page).not_to have_content('Invenção da Lampada')
    expect(page).not_to have_content('Nova forma de utilizar a lampada')
    expect(page).not_to have_link('Ver detalhes', href: idea_path(idea2))
  end

  scenario 'investor_has_a_favorite_idea_and_unfavarite_this' do
    user = User.create!(name: 'Aparecida', email: 'user1234@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: '2016-05-10',
                        amount_available_to_invest: '600')
    idea = create(:idea, title: 'Invenção da roda',
                         description: 'Nova forma de utilizar a roda',
                         estimated_project_time: 3,
                         initial_investment_value: 10_000.00,
                         estimated_time_to_profit: 24, user: user)
    idea2 = create(:idea, title: 'Invenção da Lampada',
                          description: 'Nova forma de utilizar a lampada',
                          estimated_project_time: 4,
                          initial_investment_value: 10_000.00,
                          estimated_time_to_profit: 24, user: user)

    investor = User.create(name: 'Batata', email: 'investor@user.com',
                           password: '123456', document: 123_456,
                           linkedin: 'linkedin', birth_day: '2016-05-10',
                           amount_available_to_invest: '500')

    FavoriteIdea.create(user: investor, idea: idea, active: false)

    visit root_path

    click_on 'Logar'
    fill_in 'Email', with: investor.email
    fill_in 'Senha', with: investor.password
    click_on 'Entrar'
    click_on 'Favoritas'

    expect(page).to have_content('Você ainda não possui nenhuma ideia favorita')
    expect(page).to have_css('h1', text: 'Ideias Favoritas')
    expect(page).not_to have_content('Invenção da roda')
    expect(page).not_to have_content('Nova forma de utilizar a roda')
    expect(page).not_to have_link('Ver detalhes', href: idea_path(idea))

    expect(page).not_to have_content('Invenção da Lampada')
    expect(page).not_to have_content('Nova forma de utilizar a lampada')
    expect(page).not_to have_link('Ver detalhes', href: idea_path(idea2))
  end
end

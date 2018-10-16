require 'rails_helper'

feature 'idealizer see his own ideias' do
  scenario 'successfully' do
    user_spider = User.create!(name: 'Spider', email: 'spider@user.com',
                               password: '123456', document: 123_456,
                               linkedin: 'linkedin', birth_day: 10 / 0o5 / 2016)

    user = User.create!(name: 'Aparecida', email: 'user2@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: 10 / 0o5 / 2016)

    Idea.create!(title: 'Suporte de geladeira',
                 description: 'A melhor invenção',
                 estimated_project_time: 2,
                 initial_investment_value: 400,
                 estimated_time_to_profit: 10,
                 user: user)

    Idea.create!(title: 'Suportenovo',
                 description: 'A melhor invenção',
                 estimated_project_time: 2,
                 initial_investment_value: 400,
                 estimated_time_to_profit: 10,
                 user: user)

    Idea.create!(title: 'Ideia de aranha',
                 description: 'Invenção de aranha',
                 estimated_project_time: 4,
                 initial_investment_value: 500,
                 estimated_time_to_profit: 20,
                 user: user_spider)

    visit root_path
    click_on 'Logar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'
    click_on 'Minhas ideias'

    expect(page).to have_css('h5', text: 'Suporte de geladeira')
    expect(page).to have_css('p', text: 'A melhor invenção')
    expect(page).to have_css('li', text: '2 meses')
    expect(page).to have_css('li', text: 'R$ 400.0')
    expect(page).to have_css('li', text: '10 meses')
    expect(page).to have_css('li', text: 'Aparecida')

    expect(page).to have_css('h5', text: 'Suportenovo')
    expect(page).to have_css('p', text: 'A melhor invenção')
    expect(page).to have_css('li', text: '2 meses')
    expect(page).to have_css('li', text: 'R$ 400.0')
    expect(page).to have_css('li', text: '10 meses')
    expect(page).to have_css('li', text: 'Aparecida')

    expect(page).not_to have_css('h5', text: 'Ideia de aranha')
    expect(page).not_to have_css('p', text: 'Invenção de aranha')
    expect(page).not_to have_css('li', text: '4 meses')
    expect(page).not_to have_css('li', text: 'R$ 500.0')
    expect(page).not_to have_css('li', text: '20 meses')
    expect(page).not_to have_css('li', text: 'Spider')
  end

  scenario 'and not have ideas to show' do
    user = User.create!(name: 'Aparecida', email: 'user3@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: '10/05/2016')

    visit root_path
    click_on 'Logar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'
    click_on 'Minhas ideias'

    expect(page).to have_content('Não há ideias cadastradas')
  end
end

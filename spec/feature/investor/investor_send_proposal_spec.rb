require 'rails_helper'

feature 'investor send proposal' do
  scenario 'successfully' do
    investor = User.create!(name: 'Aparecida', email: 'investor@user.com',
                            password: '123456', document: 123_456,
                            linkedin: 'linkedin', birth_day: '2016-05-10',
                            amount_available_to_invest: '600')
    user = User.create!(name: 'Aparecida', email: 'user2@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: '2016-05-10')
    idea = create(:idea, title: 'Invenção da roda',
                         description: 'Nova forma de utilizar a roda',
                         estimated_project_time: 3,
                         initial_investment_value: 10_000.00,
                         estimated_time_to_profit: 24, user: user)
    InvestmentType.create!(name: 'Comprar ideia')

    visit root_path

    click_on 'Logar'
    fill_in 'Email', with: investor.email
    fill_in 'Senha', with: investor.password
    click_on 'Entrar'

    within "#idea-#{idea.id}" do
      click_on 'Ver detalhes'
    end

    click_on 'Deseja investir nessa ideia?'

    select 'Comprar ideia'
    fill_in 'Dúvidas', with: 'Eu não entendi essa ideia'
    fill_in 'Fale mais sobre sua proposta', with: 'Proposta TOP'
    click_on 'Enviar'

    expect(current_path).to eq idea_path(idea.id)
    expect(page).not_to have_content('Deseja investir nessa ideia?')
    expect(page).to have_css('h2', text: ideia.title)
    expect(page).to have_css('li', text: ideia.user.name)
    expect(page).to have_css('li', text: "Tipo de investimento: \
Comprar esta ideia")
    expect(page).to have_css('li', text: 'Dúvidas: Eu não entendi essa ideia')
    expect(page).to have_css('li', text: "Fale mais sobre sua proposta: \
Proposta TOP")
  end
end

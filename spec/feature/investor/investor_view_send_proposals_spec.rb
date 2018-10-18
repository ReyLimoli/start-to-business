require 'rails_helper'

feature 'investor view send proposals' do
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
    investment_type = InvestmentType.create!(name: 'Comprar ideia')
    proposal = Proposal.create(investment_type: investment_type,
                               doubts: 'Eu não entendi essa ideia',
                               datails: 'Proposta TOP', user: investor)
    visit root_path
    click_on 'Logar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    click_on 'Minhas propostas'

    #expect()

  end
end
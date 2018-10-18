require 'rails_helper'

feature 'investor view send proposals' do
  scenario 'successfully' do
    investor = User.create!(name: 'Aparecida', email: 'investor@user.com',
                            password: '123456', document: 123_456,
                            linkedin: 'linkedin', birth_day: '2016-05-10',
                            amount_available_to_invest: '600')
    investor_nao_mostra = User.create!(name: 'Aparecida', email: 'investornaomostra@user.com',
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
                               details: 'Proposta TOP', user: investor)
    proposal_dois = Proposal.create(investment_type: investment_type,
                                    doubts: 'Eu não entendi essa ideia também',
                                    details: 'Proposta TOPPER', user: investor)
    proposal_nao_mostra = Proposal.create(investment_type: investment_type,
                                          doubts: 'Não mostrar esta idea',
                                          details: 'proposta não aparecer', user: investor_nao_mostra)
    visit root_path
    click_on 'Logar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    click_on 'Minhas propostas'

    expect(current_path).to eq proposals_path
    expect(page).to have_css('h1', text: idea.title)
    expect(page).to have_css('li', text: idea.user.name)
    expect(page).to have_css('li', text: "Tipo de investimento: \
Comprar ideia")
    expect(page).to have_css('li', text: 'Dúvidas: Eu não entendi essa ideia')
    expect(page).to have_css('li', text: "Fale mais sobre sua proposta: \
Proposta TOP")

    expect(current_path).to eq proposals_path
    expect(page).to have_css('h1', text: idea.title)
    expect(page).to have_css('li', text: idea.user.name)
    expect(page).to have_css('li', text: "Tipo de investimento: \
Comprar ideia")
    expect(page).to have_css('li', text: 'Dúvidas: Eu não entendi essa ideia também')
    expect(page).to have_css('li', text: "Fale mais sobre sua proposta: \
Proposta TOPPER")

    expect(current_path).to eq proposals_path
    expect(page).to have_css('h1', text: idea.title)
    expect(page).to have_css('li', text: idea.user.name)
    expect(page).not_to have_css('li', text: "Tipo de investimento: \
Comprar ideia")
    expect(page).not_to have_css('li', text: 'Dúvidas: ENão mostrar esta idea')
    expect(page).not_to have_css('li', text: "Fale mais sobre sua proposta: \
proposta não aparecer")

  end
end
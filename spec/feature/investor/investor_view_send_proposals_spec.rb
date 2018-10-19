require 'rails_helper'

feature 'investor view send proposals' do
  scenario 'successfully' do
    investor = User.create!(name: 'Aparecida', email: 'investor@user.com',
                            password: '123456', document: 123_456,
                            linkedin: 'linkedin', birth_day: '2016-05-10',
                            amount_available_to_invest: '600')
    investor_nao_mostra = User.create!(name: 'Aparecida',
                                       email: 'investornaomostra@user.com',
                                       password: '123456', document: 123_456,
                                       linkedin: 'linkedin',
                                       birth_day: '2016-05-10',
                                       amount_available_to_invest: '600')
    user = User.create!(name: 'Aparecida', email: 'user2@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: '2016-05-10')
    category = Category.create(name: 'Educação/Tecnologia')
    idea = create(:idea, title: 'Invenção da roda',
                         description: 'Nova forma de utilizar a roda',
                         estimated_project_time: 3,
                         initial_investment_value: 10_000.00,
                         estimated_time_to_profit: 24, user: user,
                         category: category)
    investment_type = InvestmentType.create!(name: 'Comprar ideia')
    investment_type2 = InvestmentType.create!(name: 'Sociedade')
    Proposal.create!(investment_type: investment_type,
                     doubts: 'Eu não entendi essa ideia',
                     details: 'Proposta TOP', user: investor,
                     idea: idea)
    Proposal.create!(investment_type: investment_type,
                     doubts: 'Eu não entendi essa ideia também',
                     details: 'Proposta TOPPER', user: investor,
                     idea: idea)
    Proposal.create!(investment_type: investment_type2,
                     doubts: 'Não mostrar esta idea',
                     details: 'proposta não aparecer',
                     user: investor_nao_mostra,
                     idea: idea)
    visit root_path
    click_on 'Logar'
    fill_in 'Email', with: investor.email
    fill_in 'Senha', with: investor.password
    click_on 'Entrar'

    click_on 'Minhas propostas'

    expect(current_path).to eq proposals_path

    expect(page).to have_css('li', text: "Tipo de investimento: \
Comprar ideia")
    expect(page).to have_css('li', text: 'Dúvidas: Eu não entendi essa ideia')
    expect(page).to have_css('li', text: "Fale mais sobre sua proposta: \
Proposta TOP")
    expect(page).to have_css('h5', text: idea.title)
    expect(page).to have_css('p', text: idea.user.name)

    expect(current_path).to eq proposals_path
    expect(page).to have_css('h5', text: idea.title)
    expect(page).to have_css('p', text: idea.user.name)
    expect(page).to have_css('li', text: "Tipo de investimento: \
Comprar ideia")
    expect(page).to have_css('li', text: "Dúvidas: Eu não entendi \
essa ideia também")
    expect(page).to have_css('li', text: "Fale mais sobre sua proposta: \
Proposta TOPPER")

    expect(current_path).to eq proposals_path
    expect(page).to have_css('h5', text: idea.title)
    expect(page).to have_css('p', text: idea.user.name)
    expect(page).not_to have_css('li', text: "Tipo de investimento: \
Sociedade")
    expect(page).not_to have_css('li', text: 'Dúvidas: ENão mostrar esta idea')
    expect(page).not_to have_css('li', text: "Fale mais sobre sua proposta: \
proposta não aparecer")
  end
end

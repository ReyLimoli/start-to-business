# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    category_technology = Category.create(name: 'Tecnologia')
    category_health = Category.create(name: 'Saúde')
    investment_type_buy = InvestmentType.create!(name: 'Comprar ideia')
    investment_type_society = InvestmentType.create!(name: 'Sociedade')
    investment_type_donate = InvestmentType.create!(name: 'Doação')


    idealizer = User.create!(name: 'Tomas Edson Idealizer',
                             email: 'idealizer@user.com',
                             password: '123456', document: 123_456,
                             linkedin: 'linkedin', birth_day: '10/05/1990')

    investor_eike = User.create!(name: 'Eike Batista Investor',
                            email: 'eike@user.com',
                            password: '123456', document: 123_456,
                            linkedin: 'linkedin', birth_day: '10/05/1990',
                            amount_available_to_invest: '600')
    investor_silvio = User.create!(name: 'Silvio Santos Investor',
                            email: 'silvio@user.com',
                            password: '123456', document: 123_456,
                            linkedin: 'linkedin', birth_day: '10/05/1923',
                            amount_available_to_invest: '600')


    idea_roda = Idea.create!(title: 'Invenção da roda',
                            description: 'Nova forma de utilizar a roda',
                            estimated_project_time: 3,
                            initial_investment_value: 10_000.00,
                            estimated_time_to_profit: 24, user: idealizer,
                            category: category_technology)

    idea_pager = Idea.create!(title: 'Pager',
                             description: 'Ideia genial que dará muito lucro',
                             estimated_project_time: 3,
                             initial_investment_value: 10_000.00,
                             estimated_time_to_profit: 24, user: idealizer,
                             category: category_health)                       
                           
    idea_light = Idea.create!(title: 'Invenção da Lampada',
                             description: 'Ilumine o mundo ao seu redor',
                             estimated_project_time: 4,
                             initial_investment_value: 3000.00,
                             estimated_time_to_profit: 12, user: idealizer,
                             category: category_technology)

    Proposal.create!(investment_type: investment_type_buy,
                     doubts: 'Eu não entendi essa ideia',
                     details: 'Proposta TOP', user: investor_eike,
                     idea: idea_roda)
    Proposal.create!(investment_type: investment_type_society,
                     doubts: 'Eu não entendi essa ideia também',
                     details: 'Proposta TOPPER', user: investor_silvio,
                     idea: idea_pager)
    Proposal.create!(investment_type: investment_type_donate,
                     doubts: 'Tenho algumas dúvidas, mas entendi.',
                     details: 'Gostei dessa ideia! Vamos conversar sobre.',
                     user: investor_eike,
                     idea: idea_light)
    Invite.create!(name: 'Novo investidor da Silva',
                  linkedin: 'https://br.linkedin.com/novoinvestidordasilva',
                  email: 'novoinvestidor@email.com')
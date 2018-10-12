require 'rails_helper'

feature 'create_ideas' do
  scenario 'successfully' do

    visit root_path

    click_on 'Tenho uma Ideia'
    fill_in 'Título', with: 'Avaliação Institucional'
    fill_in 'Descrição', with: 'Eu como aluno gostaria de ter um sistema institucional no qual pudesse avaliar professores'
    fill_in 'Tempo estimado de projeto', with: 15
    fill_in 'Valor inicial do investimento', with: 7980.0
    fill_in 'Tempo estimado de ', with: 18
    click_on 'Enviar Ideia'

    expect(page).to have_content_css('h1', 'Tenho uma ideia')
    expect(page).to have_content('Avaliação Institucional')
    expect(page).to have_content_css('p', 'Eu como aluno gostaria de ter um sistema institucional no qual pudesse avaliar professores')
    expect(page).to have_content('15 meses')
    expect(page).to have_content('R$ 7.980,00')
    expect(page).to have_content('18 meses')
    expect(page).to have_content_button('Enviar Ideia')
    expect(page).to have_content_button('Continuar com a Ideia mais tarde')
    expect(page).to have_content('Sua ideia foi criada com sucesso!')
  end
=begin
  scenario 'continue_idea_later' do

    visit root_path

    click_on 'Tenho uma Ideia'
    fill_in 'title', with: 'Avaliação Institucional'
    fill_in 'description', with: 'Eu como aluno gostaria de ter um sistema institucional no qual pudesse avaliar professores'
    fill_in 'estimated_project_time', with: 15
    fill_in 'initial_investment_value', with: 7980.0
    fill_in 'estimated_time_to_profit', with: 18
    click_on 'Continuar com a Ideia mais tarde'

    expect(page).to have_content_css('h1', 'Tenho uma ideia')
    expect(page).to have_content_css('p', 'Título')
    expect(page).to have_content_css('p', 'Descrição')
    expect(page).to have_content_css('p', 'Tempo estimado de projeto')
    expect(page).to have_content_css('p', 'Valor inicial do investimento')
    expect(page).to have_content_css('p', 'Tempo estimado para retorno')
    expect(page).to have_content_button('Enviar Ideia')
    expect(page).to have_content_button('Continuar com a Ideia mais tarde')
    expect(page).to have_content_css(':success')
  end

  scenario 'unsuccessfuly_to_create_idea' do
    visit root_path

    click_on 'Tenho uma Ideia'
    fill_in 'title', with: 'Avaliação Institucional'
    fill_in 'description', with: ''
    fill_in 'estimated_project_time', with: 15
    fill_in 'initial_investment_value', with: 'batata'
    fill_in 'estimated_time_to_profit', with: 18
    click_on 'Enviar Ideia'

    expect(page).to have_content_css('h1', 'Tenho uma ideia')
    expect(page).to have_content_css('p', 'Título')
    expect(page).to have_content_css('p', 'Descrição')
    expect(page).to have_content_css('p', 'Tempo estimado de projeto')
    expect(page).to have_content_css('p', 'Valor inicial do investimento')
    expect(page).to have_content_css('p', 'Tempo estimado para retorno')
    expect(page).to have_content_button('Enviar Ideia')
    expect(page).to have_content_button('Continuar com a Ideia mais tarde')
    expect(page).to have_content_css(':alert')
  end
=end
end

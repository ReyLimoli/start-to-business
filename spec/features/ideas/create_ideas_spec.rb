require 'rails_helper'

feature 'create_ideas' do
  scenario 'successfully' do

    visit root_path

    click_on 'Tenho uma Ideia'
   
    fill_in 'Título', with: 'Avaliação Institucional'
    fill_in 'Descrição', with: 'Eu como aluno gostaria de ter um sistema institucional no qual pudesse avaliar professores'
    fill_in 'Tempo estimado de projeto', with: 15
    fill_in 'Valor inicial do investimento', with: 7980.0
    fill_in 'Tempo estimado para retorno', with: 18
    click_on 'Enviar Ideia'

    expect(page).to have_content('h1', 'Minha ideia')
    expect(page).to have_content('Avaliação Institucional')
    expect(page).to have_content('Eu como aluno gostaria de ter um sistema institucional no qual pudesse avaliar professores')
    expect(page).to have_css('p', text: '18 meses')
    expect(page).to have_content('7980.0')
    expect(page).to have_content('15 meses')
    expect(page).to have_content('Sua ideia foi criada com sucesso!')
  end

  scenario 'unsuccessfuly_to_create_idea' do
    visit root_path

    click_on 'Tenho uma Ideia'
    fill_in 'Título', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Tempo estimado de projeto', with: ''
    fill_in 'Valor inicial do investimento', with: ''
    fill_in 'Tempo estimado para retorno', with: ''
    click_on 'Enviar Ideia'
    p(current_path)
    expect(page).to have_css('h1', text: 'Tenho uma ideia')
    expect(page).to have_content('Título')
    expect(page).to have_content('Descrição')
    expect(page).to have_content('Tempo estimado de projeto')
    expect(page).to have_content('Valor inicial do investimento')
    expect(page).to have_content('Tempo estimado para retorno')
    expect(page).to have_button('Enviar Ideia')
    expect(page).to have_content('Preencha todos os campos!')

  end
end
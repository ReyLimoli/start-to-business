feature 'user see ideas favorited' do
  scenario 'successfully' do
    user = User.create!(name: 'Aparecida', email: 'user1234@user.com',
                        password: '123456', document: 123_456,
                        linkedin: 'linkedin', birth_day: 10 / 0o5 / 2016,
                        amount_available_to_invest: '600')
    idea = create(:idea, title: 'Invenção da roda',
                         description: 'Nova forma de utilizar a roda',
                         estimated_project_time: 3,
                         initial_investment_value: 10_000.00,
                         estimated_time_to_profit: 24, user: user)
    visit root_path
    click_on 'Logar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    within "#idea-#{idea.id}" do
      click_on 'Ver detalhes'
    end
    find('.favorite-button').click
    click_on 'Home'

    favorite = FavoriteIdea.last
    expect(favorite.user).to eq user
    expect(favorite.idea).to eq idea
    expect(current_path).to eq(root_path)
    expect(page).not_to have_css('.favorite-button')
    expect(page).not_to have_css('.unfavorite-button')
    expect(page).to have_css('h5', text: 'Invenção da roda')
    expect(page).to have_css('p', text: 'Nova forma de utilizar...')
  end
end

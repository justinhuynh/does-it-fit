require 'rails_helper'

feature 'user sees categories', %Q{
  As an unauthenticated user
  I want to see categories
  So that I can further look into their products

  Acceptance Criteria
  - [√] User sees entries from categories database

} do
  scenario 'user sees categories' do
    category = Category.create!(name: 'Rice paddy')

    visit '/categories'

    expect(page).to have_content('Rice paddy')
  end

  # scenario 'specify invalid credentials' do
  #   visit new_user_session_path
  #
  #   click_button 'Log in'
  #   expect(page).to have_content('Invalid email or password')
  #   expect(page).to_not have_content('Sign Out')
  # end
end

require 'rails_helper'

feature 'user sees categories', %{
  As an unauthenticated user
  I want to see categories
  So that I can further look into their products

  Acceptance Criteria
  - [√] User sees entries from categories database

} do
  scenario 'user sees categories' do
    Category.create!(name: 'Rice paddy')
    visit '/categories'
    expect(page).to have_content('Rice paddy')
  end
end

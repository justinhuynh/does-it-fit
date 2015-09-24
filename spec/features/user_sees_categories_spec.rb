require 'rails_helper'

feature 'user sees a list of categories', %{
  As an unauthenticated user
  I want to see categories
  So that I can further look into their products

  Acceptance Criteria
  - [√] User sees entries from categories database

} do
  scenario 'user sees a list of categories' do
    category = FactoryGirl.create(:category)
    visit categories_path
    expect(page).to have_content(category.name)
  end
end

require 'rails_helper'

feature 'user sees a list of categories', %{
  As an unauthenticated user
  I want to see categories
  So that I can further look into their products

  Acceptance Criteria
  - [√] User sees entries from categories database
  - [ ] User can access link to view all products in category
} do
  let!(:category) { FactoryGirl.create(:category_with_products) }

  scenario 'user sees a list of categories' do
    visit categories_path
    expect(page).to have_content(category.name)
  end

  scenario 'user clicks link to view all products in category' do
    visit categories_path
    click_link category.name

    expect(page).to have_content("Products in #{category.name}")
    expect(page).to have_content(category.products[0].title)
  end
end

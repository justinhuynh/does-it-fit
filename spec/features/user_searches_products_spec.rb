require 'rails_helper'

feature 'user uses the search function', %{
  As a user
  I want to use the search function on the site
  So that I can look for specific products

  Acceptance Criteria
  - [√] User fills in the search field
  - [√] User results based on query

} do
    let!(:product) { FactoryGirl.create(:product_with_reviews) }

    scenario "User succesffully uses the search function" do
      visit products_path
      fill_in "Search Products", with: product.title
      click_button 'Search'
      expect(page).to have_content(product.title)
    end

    scenario "User unsuccesffully uses the search function" do
      visit products_path
      fill_in "Search Products", with: 'something different'
      click_button 'Search'
      expect(page).to_not have_content(product.title)
      expect(page).to have_content('There are no posts containing the term(s)')
    end
  end

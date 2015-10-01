require 'rails_helper'
require 'pry'

feature 'user views the last review\'s product\'s details', %{
  As an authenticated user
  I want to view the most recent review made to the web app
  So that I can learn more about it

  Acceptance Criteria:
  - [√] I must be able to navigate from root
  - []  I must see the product's title, brand, category,
        and description
  - []  I must see the most recent review on the web app
} do

  scenario 'see product details and review for that product' do
    product = FactoryGirl.create(:product_with_reviews)
    product.reload
    visit root_path
    click_on 'Latest Review'
    save_and_open_page
    expect(page).to have_content(Review.last.product.title)
    expect(page).to have_content(Review.last.product.description)
  end
end

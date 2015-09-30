require 'rails_helper'
require 'pry'

feature 'user views a product\'s details', %{
  As an authenticated user
  I want to view a specific item's details
  So that I can learn more about it

  Acceptance Criteria:
  - [√] I must be able to navigate from the products index
  - []  I must see the product's title, brand, category,
        and description
  - []  I must see reviews for the product
} do

  scenario 'see product details and reviews for that product' do
    product = FactoryGirl.create(:product_with_reviews)
    product.reload
    visit product_path(product)
    expect(page).to have_content(product.title)
    expect(page).to have_content(product.brand.name)
    expect(page).to have_content(product.category.name)
    expect(page).to have_content(product.description)

    expect(page).to have_content(product.reviews[0].title)
    expect(page).to have_content(product.reviews[0].body)
    
    expect(page).to have_content(product.reviews[1].title)
    expect(page).to have_content(product.reviews[1].body)
  end
end

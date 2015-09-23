require 'rails_helper'

feature 'user views products on products page', %{
  As an authenticated user
  I want to view a list of items
  So that I can pick items to review

  Acceptance Criteria:
  - [√] I must see a list of products
} do
  let!(:product) { FactoryGirl.create(:product) }
  scenario 'views list of products' do
    visit products_path
    expect(page).to have_content(product.title)
  end

  scenario 'views product details' do
    visit product_path(product)
    expect(page).to have_content(product.title)
    expect(page).to have_content(product.brand)
    expect(page).to have_content(product.category)
    expect(page).to have_content(product.description)
  end
end

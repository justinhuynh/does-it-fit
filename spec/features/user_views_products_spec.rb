require 'rails_helper'
require 'pry'

feature 'user views products on products page', %{
  As an authenticated user
  I want to view a list of items
  So that I can pick items to review

  Acceptance Criteria:
  - [√] I must see a list of products
} do
  let!(:brand) { FactoryGirl.create(:brand) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:product) { FactoryGirl.create(:product, brand: brand, category: category) }

  scenario 'views list of products' do
    visit products_path
    expect(page).to have_content(product.title)
  end

  scenario 'views product details' do
    visit product_path(product)
    expect(page).to have_content(product.title)
    expect(page).to have_content(product.brand.name)
    expect(page).to have_content(product.category.name)
    expect(page).to have_content(product.description)
  end
end

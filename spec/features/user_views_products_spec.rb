require 'rails_helper'

feature 'user views products on products page', %{
  As an authenticated user
  I want to view a list of items
  So that I can pick items to review

  Acceptance Criteria:
  - [√] I must see a list of products
} do
  let(:brand) { Brand.create(name: 'Levis') }
  let(:category) { Category.create(name: "Pants") }
  let(:product) { FactoryGirl.create(
    :product, category_id: category.id, brand_id: brand.id
  ) }
  before :each do
    brand
    category
    product
  end
  scenario 'views list of products' do
    visit '/products'
    expect(page).to have_content(product.title)
  end

  scenario 'views product details' do
    visit '/products'
    click_link product.title
    expect(page).to have_content(product.title)
    expect(page).to have_content(product.brand.name)
    expect(page).to have_content(product.category.name)
    expect(page).to have_content(product.description)
  end
end

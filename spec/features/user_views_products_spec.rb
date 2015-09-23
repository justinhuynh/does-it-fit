require 'rails_helper'

feature 'user views products on products page', %{
  As an authenticated user
  I want to view a list of items
  So that I can pick items to review

  Acceptance Criteria:
  - [√] I must see a list of products
} do

  scenario 'views list of products' do
    sign_in
    product = FactoryGirl.create(:product)
    visit '/products'
    expect(page).to have_content(product.title)
  end

  scenario 'views product details' do
    brand = create_brand
    category = create_category
    sign_in
    product = FactoryGirl.create(:product, brand_id: brand.id, category_id: category.id)
    visit '/products'
    click_link product.title
    expect(page).to have_content(product.title)
    expect(page).to have_content(product.brand.name)
    expect(page).to have_content(product.category.name)
    expect(page).to have_content(product.description)
  end
end

def sign_in
  user = FactoryGirl.create(:user)
  visit '/'
  click_link 'Sign In'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log in'
end

def create_brand
  Brand.create!(name: "Hugo")
end

def create_category
  Category.create!(name: "Pants")
end

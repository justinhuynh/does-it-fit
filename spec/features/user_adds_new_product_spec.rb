require 'rails_helper'

feature 'user adds new product', %{
  As an authenticated user
  I want to add a product
  So that so that people can review it

  Acceptance Criteria:
  - [√] I must be logged in
  - []  I must provide title, brand, and category
  - []  I must recieve an error message for invalid form
  - []  I must get a success message and be brougt to the home page on success
} do
  let(:user) { FactoryGirl.create(:user) }
  let(:brand) { Brand.create(name: 'Levis') }
  let(:category) { Category.create(name: "Pants") }
  let(:product) { FactoryGirl.create(:product) }
  before :each do
    user
    brand
    category
    product
  end

  scenario 'user successfully adds product' do
    sign_in(user)
    visit '/products'
    click_link 'Add New Product'
    fill_in 'Title', with: product.title
    select brand.name, from: 'Brand'
    select category.name, from: 'Category'
    fill_in 'Description', with: product.description
    click_button 'Create Product'
    expect(page).to have_content('Product Successfully Added')
  end

  scenario 'user unsuccessfully adds a product' do
    sign_in(user)
    visit '/products'
    click_link 'Add New Product'
    select brand.name, from: 'Brand'
    select category.name, from: 'Category'
    fill_in 'Description', with: product.description
    click_button 'Create Product'
    expect(page).to have_content('Add a new product!')
    expect(page).to have_content('Title can\'t be blank')
  end
end

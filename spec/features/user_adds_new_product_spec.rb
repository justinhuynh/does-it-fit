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

  scenario 'user successfully adds product' do
    sign_in
    category = Category.create(name: "Pants")
    brand = Brand.create(name: 'Levis')
    visit '/products'
    click_link 'Add New Product'
    product = FactoryGirl.create(:product)
    fill_in 'Title', with: product.title
    select brand.name, from: 'Brand'
    select category.name, from: 'Category'
    fill_in 'Description', with: product.description
    click_button 'Add Product'
    expect(page).to have_content('Product Successfully Added')
  end

  scenario 'user unsuccessfully adds a product' do
    sign_in
    category = Category.create(name: "Pants")
    brand = Brand.create(name: 'Levis')
    visit '/products'
    click_link 'Add New Product'
    product = FactoryGirl.create(:product)
    select brand.name, from: 'Brand'
    select category.name, from: 'Category'
    fill_in 'Description', with: product.description
    click_button 'Add Product'
    expect(page).to have_content('Add a new product!')
    expect(page).to have_content('Title can\'t be blank')
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

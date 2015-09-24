require 'rails_helper'

feature 'user adds new product', %{
  As an authenticated user
  I want to add a product
  So that so that people can review it

  Acceptance Criteria:
  - [x] I must be logged in
  - [x]  I must provide title, brand, and category
  - [x]  I must recieve an error message for invalid form
  - [x]  I must get a success message and be brougt to the home page on success
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:brand) { FactoryGirl.create(:brand) }
  let!(:category) { FactoryGirl.create(:category) }

  scenario 'user successfully adds product' do
    sign_in(user)
    visit new_product_path
    fill_in 'Title', with: 'New Product Title'
    select brand.name, from: 'Brand'
    select category.name, from: 'Category'
    fill_in 'Description', with: 'This is a description of the product'
    click_button 'Create Product'
    expect(page).to have_content('Product Successfully Added')
  end

  scenario 'user unsuccessfully adds a product' do
    sign_in(user)
    visit new_product_path
    select brand.name, from: 'Brand'
    select category.name, from: 'Category'
    fill_in 'Description', with: 'This is a description of the product'
    click_button 'Create Product'
    expect(page).to have_content('Add a new product!')
    expect(page).to have_content('Title can\'t be blank')
  end
end

require 'rails_helper'

feature 'user adds new product', %{
  As an authenticated user
  I want to add a product
  So that so that people can review it

  Acceptance Criteria:
  - [x]  I must be logged in
  - [x]  I must provide title, brand, and category
  - [x]  I must recieve an error message for invalid form
  - [x]  I must get a success message and be brougt to the home page on success
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:brand) { FactoryGirl.create(:brand) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:review) { FactoryGirl.create(:review) }

  scenario 'user successfully adds product' do
    sign_in(user)
    visit new_product_path
    fill_in 'Title', with: 'New Product Title'
    fill_in 'Image url', with: 'http://singyourname.com/catalog/images/thing-running.jpg'
    select brand.name, from: 'Brand'
    select category.name, from: 'Category'
    fill_in 'Description', with: 'This is a description of the product'
    click_button 'Create Product'
    expect(page).to have_content('Product Successfully Added')
    finder = user.products.last
    visit product_path(finder)
    expect(page).to have_xpath("//img[contains(@src,'thing-running.jpg')]")
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

  scenario 'user is not signed in' do
    visit new_product_path
    expect(page).to have_content('You need to sign in or
      sign up before continuing.')
  end
end

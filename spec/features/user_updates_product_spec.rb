require 'rails_helper'

feature 'user updates a product', %{
  As an authenticated user
  I want to update a product
  To give it more accurate information

  Acceptance Criteria:
  - [√] I must be logged in
  - [√] I must recieve an error message if I submit an invalid update
  - [√] I must receive a success message and be brought to the updated
        product page on success
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:product) { FactoryGirl.create(:product) }

  scenario 'user successfully updates product' do
    sign_in(user)
    visit edit_product_path(product)
    fill_in 'Title', with: "New Title"
    fill_in 'Description', with: "New Description"
    click_button 'Update Product'
    expect(page).to have_content('Product Successfully Added')
    expect(page).to have_content('New Title')
    expect(page).to have_content('New Description')
  end

  scenario 'user unsuccessfully updates a product' do
    sign_in(user)
    visit edit_product_path(product)
    fill_in 'Title', with: ''
    click_button 'Update Product'
    expect(page).to have_content('Edit Product!')
    expect(page).to have_content('Title can\'t be blank')
  end

  scenario 'user is not signed in' do
    visit product_path(product)
    click_link 'Edit Product Info'
    expect(page).to_not have_content('Product Deleted')
    expect(page).to have_content("You need to sign in or
      sign up before continuing.")
  end
end

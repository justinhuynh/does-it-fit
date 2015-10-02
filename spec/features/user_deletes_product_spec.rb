require 'rails_helper'

feature 'deletes product', %{
  As an authenticated user
  I want to delete a product I added
  So that the product information is no longer retained by the app

  Acceptance Criteria:
  - [x] I must be signed in.
  - [x] The item should disappear when I click delete product
  - [x] The information must be deleted from the database
  - [x] I must be notified if my update was successful or unsuccessful.
} do
  let!(:user_1) { FactoryGirl.create(:user) }
  let!(:user_2) { FactoryGirl.create(:user) }
  let!(:product_1) { FactoryGirl.create(:product, user: user_1) }
  let!(:product_2) { FactoryGirl.create(:product, user: user_2) }
  let!(:review) { FactoryGirl.create(:review) }

  scenario 'authenticated user deletes own product' do
    sign_in(user_1)
    visit product_path(product_1)
    click_link 'Delete Product'
    expect(page).to have_content('Product Deleted')
    expect(page).to have_no_content(product_1.title)
  end

  scenario 'authenticated user cannot delete product added by others' do
    sign_in(user_1)
    visit product_path(product_2)
    click_link 'Delete Product'
    expect(page).to_not have_content('Product Deleted')
    expect(page).to have_content("You cannot modify another user\'s product")
  end

  scenario 'Non-user clicks delete product' do
    visit product_path(product_1)
    click_link 'Delete Product'
    expect(page).to_not have_content('Product Deleted')
    expect(page).to have_content("You need to sign in or
      sign up before continuing.")
  end
end

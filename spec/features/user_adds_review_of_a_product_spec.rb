require 'rails_helper'

feature 'user adds review of a product', %{
  As an authenticated user
  I want to add a review of a product
  So that so that people can read the review

  Acceptance Criteria:
  - [√] I must be logged in
  - [√] I must provide title, body, product fit
  - [√] I must recieve an error message for invalid form
  - [√] I must get a success message and be brought
        to the home page on success
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:product) { FactoryGirl.create(:product) }

  context "user is signed in" do
    before (:each) do
      sign_in(user)
      visit product_path(product)
    end

    scenario 'user successfully adds review to product' do
      fill_in 'Title', with: 'My Review'
      fill_in 'Body', with: 'This doesn\'t fit!'
      fill_in 'Product fit', with: 3
      click_button 'Create Review'
      expect(page).to have_content('Review successfully added')
      expect(page).to have_content('My Review')
    end

    scenario 'user unsuccessfully adds review to product' do
      fill_in 'Title', with: ''
      fill_in 'Body', with: 'This doesn\'t fit!'
      fill_in 'Product fit', with: 'asdf'
      click_button 'Create Review'
      expect(page).to have_content('Title can\'t be blank')
      expect(page).to have_content('Product fit is not included in the list')
    end
  end

  scenario 'user is not signed in' do
    visit product_path(product)
    fill_in 'Title', with: 'My Review'
    fill_in 'Body', with: 'This doesn\'t fit!'
    fill_in 'Product fit', with: 3
    click_button 'Create Review'
    expect(page).to_not have_content('Review successfully added')
    expect(page).to have_content('You need to sign in or
      sign up before continuing.')
  end
end

require 'rails_helper'

feature 'admin deletes product', %{
  As an authenticated admin
  I want to delete a product
  So that I can remove unwanted products from the site

  Acceptance Criteria:
  - [ ] I must be signed in as an admin
  - [ ] The product must be deleted from the database
  - [ ] I must be notified that my deletion was successful
} do

  # scenario 'Logged in user clicks delete account' do
  #   # user = FactoryGirl.create(:user)
  #   # visit new_user_session_path
  #   # fill_in 'Email', with: user.email
  #   # fill_in 'Password', with: user.password
  #   # click_button 'Log in'
  #   # click_link 'Edit Your User Profile'
  #   # click_button 'Cancel my account'
  #   # expect(page).to have_content('Bye!')
  #   # expect(User.find_by(email: user.email)).to be_nil
  # end
end

require 'rails_helper'

feature 'admin deletes product', %{
  As an authenticated admin
  I want to delete a user account
  So that I can remove unwanted users or inactive accounts

  Acceptance Criteria:
  - [ ] I must be signed in as an admin
  - [ ] I must
  - [ ] My information must be deleted from the database
  - [ ] I must be notified if my update was successful or unsuccessful.
} do

  # scenario 'Logged in user clicks delete account' do
    # user = FactoryGirl.create(:user)
    # visit new_user_session_path
    # fill_in 'Email', with: user.email
    # fill_in 'Password', with: user.password
    # click_button 'Log in'
    # click_link 'Edit Your User Profile'
    # click_button 'Cancel my account'
    # expect(page).to have_content('Bye!')
    # expect(User.find_by(email: user.email)).to be_nil
  # end
end

require 'rails_helper'

feature 'deletes account', %{
  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app

  Acceptance Criteria:
  - [X] I must be signed in.
  - [X] I must be logged out when I click delete account
  - [X] My information must be deleted from the database
  - [X] I must be notified if my update was successful or unsuccessful.
} do

  scenario 'Logged in user clicks delete account' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'Edit Your User Profile'
    click_button 'Cancel my account'
    expect(page).to have_content('Bye!')
    expect(User.find_by(email: user.email)).to be_nil
  end

end

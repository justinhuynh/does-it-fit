require 'rails_helper'

feature 'user deletes account', %Q{
  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app

  Acceptance Criteria
  - [√] If I'm signed in, I have an option to delete
        my account
  - [√] When I opt to sign out, I get a confirmation
        that my account has been deleted
} do

  scenario 'authenticated user deletes account' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link 'Edit Your User Profile'
    click_button 'Cancel my account'

    expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
    expect(User.find_by(email: user.email)).to be_nil
  end

  scenario 'unauthenticated user attempts to delete account' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link 'Edit Your User Profile'
    click_button 'Cancel my account'

    expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
    expect(User.find_by(email: user.email)).to be_nil
  end
end

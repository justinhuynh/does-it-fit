require 'rails_helper'

feature 'user updates info', %{
  As an existing user
  I want to update my account
  So that I can reflect up-to-date information

  Acceptance Criteria:
  - [X] I must be signed in.
  - [X] I must provide information in the form and use submit button.
  - [X] I must provide unique information.
  - [X] I must be notified if my update was successful or unsuccessful.
} do
  let!(:review) { FactoryGirl.create(:review) }

  scenario 'Successfully update registration information' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('Sign Out')
    click_link 'Edit Your User Profile'
    fill_in 'Email', with: 'john@yahoo.com'
    fill_in 'Password', with: 'Password2'
    fill_in 'Password confirmation', with: 'Password2'
    fill_in 'Current password', with: user.password
    click_button 'Update'
    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario 'provide invalid registration information' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
  end
end

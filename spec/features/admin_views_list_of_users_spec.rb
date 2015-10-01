require 'rails_helper'

feature 'admin views list of users', %{
  As an authenticated admin
  I want to view a list of users
  So that I can see all users and delete accounts

  Acceptance Criteria:
  - [X] I must see a list of users
  - [X] I must see the option to delete users from the list
  - [X] Non-admin users cannot access this page
} do
  let!(:user_1) { FactoryGirl.create(:user) }
  let!(:user_2) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:review) { FactoryGirl.create(:review) }

  scenario 'admin views list of users' do
    sign_in(admin)
    visit users_path

    expect(page).to have_content(user_1.email)
    expect(page).to have_content(user_2.email)
    expect(page).to have_content('Delete User')
  end

  scenario 'non-admin attempts to view list of users' do
    sign_in(user_1)
    visit users_path

    expect(page).to have_content("You are not authorized to view this page")
    expect(page).to_not have_content(user_2.email)
  end
end

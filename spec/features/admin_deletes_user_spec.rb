require 'rails_helper'

feature 'admin deletes product', %{
  As an authenticated admin
  I want to delete a user account
  So that I can remove unwanted users or inactive accounts

  Acceptance Criteria:
  - [X] I must be signed in as an admin
  - [X] The user I choose to delete must be deleted from the database
  - [X] I must be notified that the deletion was successful
  - [X] I will be redirected to the list of users
} do
  let!(:user_1) { FactoryGirl.create(:user) }
  let!(:user_2) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:admin) }

  scenario 'authenticated admin clicks delete account' do
    sign_in(admin)
    visit users_path

    first(:link, "Delete User").click
    expect(page).to have_content("User was successfully deleted")
    expect(page).to_not have_content(user_1.email)
    expect(page).to have_content(user_2.email)
  end
end

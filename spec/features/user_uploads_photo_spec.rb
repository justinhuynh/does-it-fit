require 'rails_helper'

feature 'user uploads a photo to their profile', %{
  As an authenticated user
  I want to upload a photo to my profile

  Acceptance Criteria:
  - [√] I must be logged in
  - []  I must upload my photo to server
  - []  I must see my uploaded photo in my profile
} do
  context "user registers new account" do
    scenario "user uploads photo during registration" do
      visit new_user_registration_path
      fill_in 'Email', with: 'carrierwave@yahoo.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      attach_file "Profile Photo", "#{Rails.root}/spec/support/images/example_photo.jpg"
      save_and_open_page
      click_on "Sign up"
      expect(page).to have_content("You have signed up successfully.")
      visit edit_user_registration_path
      user = User.last
      save_and_open_page
      expect(page).to have_content("Password confirmation")
      expect(page).to have_css("img[src*='example_photo.jpg']")
      expect(user.profile_photo.file.filename).to eq("example_photo.jpg")
    end
  end
end

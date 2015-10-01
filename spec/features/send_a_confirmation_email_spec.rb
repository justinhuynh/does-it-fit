require 'rails_helper'

feature 'sends a notification e-mail', %{
  As an authenticated user
  I =want to recieve an email when someone reviews one of my products
  So that I know what people are saying about it

  Acceptance Criteria:
  - [] A user must submit a reveiw on a product I created
  - [] An email is sent to my user account email address
  - [] The email tells me which product was reviewed
} do
  let!(:review) { FactoryGirl.create(:review) }
  ActionMailer::Base.deliveries.clear
  scenario "review a product", js: true do
    product = FactoryGirl.create(:product)
    user = FactoryGirl.create(:user)

    sign_in(user)

    visit product_path(product)

    fill_in "Title", with: "Total garbage."
    fill_in "Body", with: "Not great."
    click_button "Create Review"
    expect(page).to have_content("Total garbage.")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end

require 'rails_helper'

feature 'deletes review', %{
  As an authenticated user
  I want to delete a review
  So that the review is no longer retained by the app

  Acceptance Criteria:
  - [x] I must be signed in.
  - [x] The item should disappear when I click delete review
  - [x] The information must be deleted from the database
  - [x] I must be notified if my update was successful
} do
  context "user is original poster of review," do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:product) { FactoryGirl.create(:product) }
    let!(:review) { FactoryGirl.create(:review, user: user, product: product) }

    scenario "user successfully deletes own review" do
      sign_in(user)
      visit product_path(product)
      first(:link, "Delete Review").click
      expect(page).to have_content('Review Deleted')
      expect(page).to_not have_content(review.title)
    end
  end

  context "user is not original poster of review" do
    let!(:user_poster) { FactoryGirl.create(:user) }
    let!(:user_trying_to_edit) do
      FactoryGirl.create(:user, email: 'test@gmail.com')
    end
    let!(:product) { FactoryGirl.create(:product) }
    let!(:review) do
      FactoryGirl.create(:review, user: user_poster, product: product)
    end

    scenario 'user can only see the delete link to their review' do
      sign_in(user_trying_to_edit)
      visit product_path(product)
      expect(page).to_not have_selector(:link_or_button, 'Delete Review')
    end
  end
end

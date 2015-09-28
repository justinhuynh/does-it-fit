require 'rails_helper'

feature 'deletes review', %{
  As an authenticated user
  I want to delete a review
  So that the review is no longer retained by the app

  Acceptance Criteria:
  - [x] I must be signed in.
  - [x] The item should disappear when I click delete review
  - [x] The information must be deleted from the database
  - [x] I must be notified if my update was successful or unsuccessful.
} do
  let!(:user) { FactoryGirl.create(:user, id: 1, email: 'test@gmail.com') }
  let!(:product) { FactoryGirl.create(:product_with_reviews) }
  #
  # scenario 'Logged in user deletes review' do
  #   sign_in(user)
  #   visit product_path(product)
  #   click_link 'Delete Review'
  #   expect(page).to have_content('Review Deleted')
  #   expect(page).to have_content('Deleted!')
  # end
  #
  # scenario 'Non-user clicks delete review' do
  #   visit review_path(review)
  #   click_link 'Delete Product'
  #   expect(page).to have_no_content('Product Deleted')
  #   expect(page).to have_content('You must be signed in.')
  # end

end

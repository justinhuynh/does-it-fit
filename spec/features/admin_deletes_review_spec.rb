require 'rails_helper'

feature 'admin deletes review', %{
  As an authenticated admin
  I want to delete a review
  So that I can remove unwanted reviews from the site

  Acceptance Criteria:
  - [X] I must be signed in as an admin
  - [X] The review must be deleted from the database
  - [X] I must be notified that my deletion was successful
} do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:product) { FactoryGirl.create(:product) }
  let!(:review_1) { FactoryGirl.create(:review, user: user, product: product) }
  let!(:review_2) { FactoryGirl.create(:review, user: user, product: product) }

  scenario 'admin deletes review' do
    sign_in(admin)
    visit product_path(product)
    first(:link, "Delete Review").click
    expect(page).to have_content('Review Deleted')
    expect(page).to_not have_content(review_1.title)
  end
end

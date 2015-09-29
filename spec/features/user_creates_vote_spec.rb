require 'rails_helper'

feature 'user votes on review', %{
  As an authenticated user
  I want to vote on a review
  So that so that people can know whether the review is helpful

  Acceptance Criteria:
  - [ ] I must be logged in
  - [ ] I must see that my vote is counted
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:product) { FactoryGirl.create(:product_with_reviews) }

  scenario 'user upvotes a review', js: true do
    sign_in(user)
    visit product_path(product)
    review_id = product.reviews[0].id
    vote_count = find("li#review#{review_id} .up-count").text.to_i
    expect(vote_count).to eq(0)
    find("li#review#{review_id}").find(".up").click
    save_screenshot("capybara-js.png")
    vote_count = find("li#review#{review_id} .up-count").text.to_i
    expect(vote_count).to eq(1)
    expect(page).to have_content('Thanks for your vote')
  end

  scenario 'user downvotes a review', js: true do
    sign_in(user)
    visit product_path(product)
    review_id = product.reviews[0].id
    vote_count = find("li#review#{review_id} .down-count").text.to_i
    expect(vote_count).to eq(0)
    find("li#review#{review_id}").find(".down").click
    save_screenshot("capybara-js.png")
    vote_count = find("li#review#{review_id} .down-count").text.to_i
    expect(vote_count).to eq(1)
    expect(page).to have_content('Thanks for your vote')
  end

  scenario 'user is not signed in', js: true do
    visit product_path(product)
    review_id = product.reviews[0].id
    find("li#review#{review_id}").find(".down").click
    save_screenshot("capybara-js.png")
    expect(page).to have_content('You must sign in to vote')
  end
end

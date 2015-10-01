require 'rails_helper'

feature 'user votes on review', %{
  As an authenticated user
  I want to change my vote on a review
  So that I can tell others if no longer find a review helpful

  Acceptance Criteria:
  - [ ] I must be logged in
  - [ ] I must see that my vote has changed the vote count
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:product) { FactoryGirl.create(:product_with_reviews) }
  let!(:vote) do
    FactoryGirl.create(:vote, review: product.reviews[0], user: user)
  end

  scenario 'user downvotes a previously upvoted review', js: true do
    sign_in(user)
    visit product_path(product)
    review_id = product.reviews[0].id
    vote_count = find("li#review#{review_id} .up-count").text.to_i
    expect(vote_count).to eq(1)
    find("li#review#{review_id}").find(".down").click
    sleep(0.5)
    expect(page).to have_content('Thanks for your vote')
    up_vote_count = find("li#review#{review_id} .up-count").text.to_i
    down_vote_count = find("li#review#{review_id} .down-count").text.to_i
    expect(up_vote_count).to eq(0)
    expect(down_vote_count).to eq(1)
  end
end

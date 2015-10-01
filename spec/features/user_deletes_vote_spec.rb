require 'rails_helper'

feature 'deletes vote', %{
  As an authenticated user
  I want to delete vote
  So that the vote is no longer retained by the app

  Acceptance Criteria:
  - [x] I must be signed in.
  - [x] The vote count should be updated to reflect removal of a vote
  - [x] I can only delete a vote if I have already voted
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:product) { FactoryGirl.create(:product_with_reviews) }
  let!(:vote) { FactoryGirl.create(:vote, review: product.reviews[0], user: user) }

  scenario 'user deletes vote', js: true do
    sign_in(user)
    visit product_path(product)
    review_id = product.reviews[0].id
    vote_count = find("li#review#{review_id} .up-count").text.to_i
    expect(vote_count).to eq(1)
    click_link 'Delete Vote'
    sleep(0.5)
    expect(page).to have_content('Your vote has been deleted')
    up_vote_count = find("li#review#{review_id} .up-count").text.to_i
    down_vote_count = find("li#review#{review_id} .down-count").text.to_i
    expect(up_vote_count).to eq(0)
    expect(down_vote_count).to eq(0)
  end
end

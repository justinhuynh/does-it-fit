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

  scenario 'user upvotes a review' do
    sign_in(user)
    visit product_path(product)
    vote_count = find_by_id("up_count_1").text.to_i
    expect(vote_count).to eq(0)

    find('.up1').click
    vote_count = find_by_id("up_count_1").text.to_i
    expect(vote_count).to eq(1)
    expect(page).to have_content('Thanks for your vote')
  end

  scenario 'user downvotes a review' do
    sign_in(user)
    visit product_path(product)
    vote_count = find_by_id("down_count_2").text.to_i
    expect(vote_count).to eq(0)

    find('.down2').click
    vote_count = find_by_id("down_count_2").text.to_i
    expect(vote_count).to eq(1)
    expect(page).to have_content('Thanks for your vote')
  end

  scenario 'user is not signed in' do
    visit product_path(product)
    vote_count = find_by_id("down_count_3").text.to_i
    expect(vote_count).to eq(0)

    find('.down3').click
    expect(page).to have_content('You need to sign in
      or sign up before continuing.')
  end
end

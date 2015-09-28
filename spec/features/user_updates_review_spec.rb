require 'rails_helper'

feature 'user updates a review', %{
  As an authenticated user
  I want to update a review I made previously

  Acceptance Criteria:
  - [√] I must be logged in
  - []  I must provide title, brand, and category
  - []  I must recieve an error message for invalid form
  - []  I must get a success message and be brougt to the
        product page on success
} do
    context "user's email is test@gmail.com" do
      let!(:user) { FactoryGirl.create(:user, email: 'test@gmail.com') }
      let!(:product) { FactoryGirl.create(:product_with_reviews) }

      scenario 'user successfully updates review' do
        sign_in(user)
        visit product_path(product)
        first(:link, "Edit Review").click

        fill_in 'Title', with: 'this is a title'
        fill_in 'Body', with: 'this is a review'
        fill_in 'Product fit', with: 1
        click_button 'Update Review'
        expect(page).to have_content('review updated successfully!')
      end

      scenario 'user unsuccessfully adds a product' do
        sign_in(user)
        visit product_path(product)
        first(:link, "Edit Review").click
        fill_in 'Title', with: ''
        fill_in 'Body', with: ''
        fill_in 'Product fit', with: ''
        click_button 'Update Review'
        save_and_open_page
        expect(page).to_not have_content('review updated successfully!')
        expect(page).to have_content('Title can\'t be blank')
        expect(page).to have_content('Body can\'t be blank')
        expect(page).to have_content('Product fit can\'t be blank')
        expect(page).to have_content('Product fit is not a number')
        expect(page).to have_content('Product fit is not included in the list')
      end
    end

  context "user's email does not match the any review posters email" do
    let!(:user_poster) { FactoryGirl.create(:user) }
    let!(:user_trying_to_edit) { FactoryGirl.create(:user, email: 'test@gmail.com') }
    let!(:product) do
      FactoryGirl.create(:product, id: 1)
    end
    let!(:review) { FactoryGirl.create(:review, user_id: user_poster.id, product_id: 1) }

    scenario 'user can only see the edit link to their review' do
      sign_in(user_trying_to_edit)
      visit product_path(product)
      page.should_not have_selector(:link_or_button, 'Edit Review')
    end

  scenario 'user can only edit their own review' do
    sign_in(user_trying_to_edit)
    visit '/products/1/review/1/edit'

  end
  end
end

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
  let!(:user) { FactoryGirl.create(:user) }
  let!(:edit_review) { FactoryGirl.create(:edit_review) }
  # let!(:brand) { Brand.create(name: 'Levis') }
    # let!(:current_user) { FactoryGirl.create(:current_user) }
  # let!(:category) { Category.create(name: "Pants") }
  let!(:review) { FactoryGirl.create(:review, user_id: user.id, product_id: 1) }
  let!(:product) do
    FactoryGirl.create(:product, id: 1)
  end
  scenario 'user successfully updates review' do
    sign_in(user)
    visit product_path(product)
    save_and_open_page
    first(:button, "Edit review").click
    visit edit_product_path(product)
    fill_in 'Title', with: edit_review.title
    fill_in 'Body', with: edit_review.body
    fill_in 'Product Fit', with: edit_review.product_fit
    click_button 'Update Review'
    expect(page).to have_content('Review Successfully Editted!')
  end

  # scenario 'user unsuccessfully adds a product' do
  #   sign_in(user)
  #   visit edit_product_path(product)
  #   fill_in 'Title', with: ''
  #   select brand.name, from: 'Brand'
  #   select category.name, from: 'Category'
  #   fill_in 'Description', with: product.description
  #   click_button 'Update Product'
  #   expect(page).to have_content('Edit Product!')
  #   expect(page).to have_content('Title can\'t be blank')
  # end

end

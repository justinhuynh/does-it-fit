require 'rails_helper'

feature 'deletes account', %{
  As an authenticated user
  I want to delete a product
  So that the product information is no longer retained by the app

  Acceptance Criteria:
  - [x] I must be signed in.
  - [x] The item should disappear when I click delete product
  - [x] The information must be deleted from the database
  - [x] I must be notified if my update was successful or unsuccessful.
} do
  let!(:brand) { Brand.create(name: 'Levis') }
  let!(:category) { Category.create(name: "Pants") }
  let!(:product) do
    FactoryGirl.create(:product, category_id: category.id, brand_id: brand.id)
  end

  scenario 'Logged in user clicks delete product' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit product_path(product)
    click_link 'Delete Product'
    expect(page).to have_content('Product Deleted')
    expect(page).to have_no_content(product.title)
  end

  scenario 'Non-user clicks delete product' do
    visit product_path(product)
    click_link 'Delete Product'
    expect(page).to have_no_content('Product Deleted')
    expect(page).to have_content('You must be signed in.')
  end

end

require 'rails_helper'

feature 'deletes account', %{
  As an authenticated user
  I want to delete a product
  So that the product information is no longer retained by the app

  Acceptance Criteria:
  - [ ] I must be signed in.
  - [ ] The item should disappear when I click delete product
  - [ ] The information must be deleted from the database
  - [ ] I must be notified if my update was successful or unsuccessful.
} do

  scenario 'Logged in user clicks delete product' do
    user = FactoryGirl.create(:user)
    brand = Brand.create(name: 'JNCO')
    category = Category.create(name: 'Pants')
    sign_in(user)
    product = FactoryGirl.create(
      :product, brand: brand, category: category
    )
    visit product_path(product)
    click_link 'Delete Product'
    expect(page).to have_content('Product Deleted')
    expect(page).to have_no_content(product.title)
  end

end

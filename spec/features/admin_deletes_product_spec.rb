require 'rails_helper'

feature 'admin deletes product', %{
  As an authenticated admin
  I want to delete a product
  So that I can remove unwanted products from the site

  Acceptance Criteria:
  - [X] I must be signed in as an admin
  - [X] The product must be deleted from the database
  - [X] I must be notified that my deletion was successful
} do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:product) { FactoryGirl.create(:product) }

  scenario 'admin deletes product' do
    sign_in(admin)
    visit product_path(product)
    click_link 'Delete Product'
    expect(page).to have_content('Product Deleted')
    expect(page).to have_no_content(product.title)
    expect{ visit product_path(product) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end

require 'rails_helper'

feature 'user updates a product', %{
  As an authenticated user
  I want to update a product
  To give it more accurate information

  Acceptance Criteria:
  - [√] I must be logged in
  - []  I must provide title, brand, and category
  - []  I must recieve an error message for invalid form
  - []  I must get a success message and be brougt to the
        product page on success
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:brand) { Brand.create(name: 'Levis') }
  let!(:category) { Category.create(name: "Pants") }
  let!(:product) do
    FactoryGirl.create(:product, category_id: category.id, brand_id: brand.id)
  end
  scenario 'user successfully updates product' do
    sign_in(user)
    visit edit_product_path(product)
    fill_in 'Title', with: product.title
    select brand.name, from: 'Brand'
    select category.name, from: 'Category'
    fill_in 'Description', with: product.description
    click_button 'Update Product'
    expect(page).to have_content('Product Successfully Added')
  end

  scenario 'user unsuccessfully adds a product' do
    sign_in(user)
    visit edit_product_path(product)
    fill_in 'Title', with: ''
    select brand.name, from: 'Brand'
    select category.name, from: 'Category'
    fill_in 'Description', with: product.description
    click_button 'Update Product'
    expect(page).to have_content('Edit Product!')
    expect(page).to have_content('Title can\'t be blank')
  end

end

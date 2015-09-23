require 'rails_helper'
require 'pry'

feature 'user views reviews of a product', %{
  As a prospective user
  I want to views the reviews of a product
  So that I can know what to expect of a product

  Acceptance Criteria:
  - [√] I must see the reviews for that product
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:brand) { FactoryGirl.create(:brand) }
  let!(:product) do
    FactoryGirl.create(:product, category_id: category.id, brand_id: brand.id)
  end
  let!(:review) do
    FactoryGirl.create(:review, user_id: user.id, product_id: product.id)
  end

  scenario 'see reviews of a product' do
    visit product_path(product)
    expect(page).to have_content(product.reviews[0].title)
    expect(page).to have_content(product.reviews[0].body)
  end
end

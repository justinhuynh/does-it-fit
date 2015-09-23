require 'rails_helper'
require 'pry'

feature 'user views reviews of a product', %{
  As a prospective user
  I want to views the reviews of a product
  So that I can know what to expect of a product

  Acceptance Criteria:
  - [√] I must see the reviews for that product
} do
  let!(:product) { FactoryGirl.create(:product) }
  let!(:review) { FactoryGirl.create(:review) }

  scenario 'see reviews of a product' do
    visit product_path(product)
    expect(page).to have_content(product.reviews[0])
    expect(page).to have_content(product.reviews[0])
  end
end

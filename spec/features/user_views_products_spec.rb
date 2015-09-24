require 'rails_helper'
require 'pry'

feature 'user views list of products on products page', %{
  As an authenticated user
  I want to view a list of items
  So that I can pick items to review

  Acceptance Criteria:
  - [√] I must see a list of products
} do
  let!(:product_1) { FactoryGirl.create(:product) }
  let!(:product_2) { FactoryGirl.create(:product) }

  scenario 'views list of products' do
    visit products_path
    expect(page).to have_content(product_1.title)
    expect(page).to have_content(product_2.title)
  end
end

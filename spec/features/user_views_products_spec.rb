require 'rails_helper'

feature 'user views products on products page', %{
  As an authenticated user
  I want to view a list of items
  So that I can pick items to review

  Acceptance Criteria:
  - [√] I must see a list of products
} do

  scenario 'views list of products' do
    sign_in
    product = FactoryGirl.create(:product)
    visit '/products'
    expect(page).to have_content(product.title)
  end

  # scenario 'provide invalid registration information' do
  #   visit new_user_registration_path
  #
  #   click_button 'Sign up'
  #   expect(page).to have_content("can't be blank")
  #   expect(page).to_not have_content('Sign Out')
  # end
end



# factory :product do
#   title 'Albert snow shoes'
#   brand_id 1
#   category_id 1
#   image_url 'http://www.cg.cfpsa.ca/cg-pc
#   /Moncton/EN/Rentals/Equipment/PublishingImages/rental%20snow%20shoes.jpg'
#   vendor_url 'www.amazon.com'
#   description 'great shoes for the family in the snow!'
# end

def sign_in
  user = FactoryGirl.create(:user)
  visit '/'
  click_link 'Sign In'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log in'
end

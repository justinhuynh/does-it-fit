require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :product do
    title 'Albert snow shoes'
    brand_id 1
    category_id 1
    image_url 'http://www.cg.cfpsa.ca/cg-pc
    /Moncton/EN/Rentals/Equipment/PublishingImages/rental%20snow%20shoes.jpg'
    vendor_url 'www.amazon.com'
    description 'great shoes for the family in the snow!'
  end

  factory :category do
    name 'Pants'
  end

  factory :brand do
    name 'Hugo'
  end

  factory :review do
    title 'This is awesome'
    body 'Fits my body so nicely'
    product_fit 7
    user_id 1
    product_id 1
  end

  factory :edit_review, :class => 'Review' do
    title 'Review is changed!'
    body 'I had to change my review'
    product_fit 4
    user_id 1
    product_id 1
  end

  factory :current_user, :class => 'User' do
    user current_user
  end
  
end

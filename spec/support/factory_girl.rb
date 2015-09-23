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

end

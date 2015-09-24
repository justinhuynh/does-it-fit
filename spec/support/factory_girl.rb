require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :category do
    sequence(:name) { |n| "#{n} Pants" }
  end

  factory :brand do
    sequence(:name) { |n| "#{n} Hugo" }
  end

  factory :product do
    sequence(:title) { |n| "#{n} Albert snow shoes" }
    brand FactoryGirl.create(:brand)
    category FactoryGirl.create(:category)
    image_url 'http://www.cg.cfpsa.ca/cg-pc
    /Moncton/EN/Rentals/Equipment/PublishingImages/rental%20snow%20shoes.jpg'
    vendor_url 'www.amazon.com'
    description 'great shoes for the family in the snow!'
  end

  factory :review do
    title 'This is awesome'
    body 'Fits my body so nicely'
    product_fit 7
    user_id FactoryGirl.create(:user)
    product_id FactoryGirl.create(:product)
  end
end

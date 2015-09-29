require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

    factory :admin do
      sequence(:email) {|n| "admin#{n}@example.com" }
      user_type "admin"
    end
  end

  factory :category do
    sequence(:name) { |n| "#{n} Pants" }
  end

  factory :brand do
    sequence(:name) { |n| "#{n} Hugo" }
  end

  factory :review do
    sequence(:title) { |n| "This is awesome #{n}" }
    body 'Fits my body so nicely'
    product_fit 5
    user
    product
  end

  factory :product do
    sequence(:title) { |n| "#{n} Albert snow shoes" }
    brand
    category
    image_url 'http://www.cg.cfpsa.ca/cg-pc
    /Moncton/EN/Rentals/Equipment/PublishingImages/rental%20snow%20shoes.jpg'
    vendor_url 'www.amazon.com'
    user
    description 'great shoes for the family in the snow!'

    factory :product_with_reviews do
      after(:create) do |product|
        FactoryGirl.create(:review, product: product)
        FactoryGirl.create(:review, product: product)
        FactoryGirl.create(:review, product: product)
        FactoryGirl.create(:review, product: product)
      end
    end
  end
end

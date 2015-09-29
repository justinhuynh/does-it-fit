Brand.destroy_all
Category.destroy_all
Product.destroy_all
Review.destroy_all
User.destroy_all
Vote.destroy_all

User.create(email: 'EricJZell@gmail.com', password: '12345678')

10.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

20.times do
  Brand.create(name: Faker::Company.name)
end

categories = [
  'Pants', 'Dress Shirts', 'Casual Shirts', 'Shoes', 'Jackets', 'Outerwear',
  'Shorts', 'Swimwear', 'Hats', 'Sweaters', 'Athletic Wear', 'Sporting Goods'
]

categories.each do |category|
  Category.create(name: category)
end

20.times do
  Product.create(
    title: Faker::Commerce.product_name,
    brand: Brand.all.sample,
    category: Category.all.sample,
    average_fit: [*(1..10)].sample,
    description: Faker::Lorem.sentences(5).join(' ')
  )
end

Product.all.each do |product|
  rand(10).times do
    Review.create(
      title: Faker::App.name,
      body: Faker::Lorem.sentences(3).join(' '),
      product_fit: [*(1..10)].sample,
      user: User.all.sample,
      product: product
    )
  end
end

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

# 20.times do
#   Brand.create(name: Faker::Company.name)
# end

categories = [
  'Pants', 'Dress Shirts', 'Casual Shirts', 'Shoes', 'Jackets', 'Outerwear',
  'Shorts', 'Swimwear', 'Hats', 'Sweaters', 'Athletic Wear', 'Sporting Goods'
]

categories.each do |category|
  Category.create(name: category)
end

category = Category.find_by(name: 'Pants')
brand = Brand.create(name: 'Patagonia')
titles = [
  'PATAGONIA MEN\'S VENGA ROCK PANTS',
  'PATAGONIA MEN\'S REGULAR FIT JEANS',
  'PATAGONIA MEN\'S STRAIGHT FIT CORDS'
]
urls = [
  'http://www.patagonia.com/tsimages/83080_UWTB.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive',
  'http://www.patagonia.com/tsimages/55940_DDNM.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive',
  'http://www.patagonia.com/tsimages/55920_ASHT.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive'
]

count = 0
titles.each do |title|
  Product.create(
    title: title,
    brand: brand,
    category: category,
    user: User.all.sample,
    image_url: urls[count]
  )
  count +=1
end

# Product.all.each do |product|
#   rand(10).times do
#     Review.create(
#       title: Faker::App.name,
#       body: Faker::Lorem.sentences(3).join(' '),
#       product_fit: [*(1..10)].sample,
#       user: User.all.sample,
#       product: product
#     )
#   end
# end
#
#
# Product.create(
#   title: 'Wrinkle-Free Dress Chinos, Classic Fit Pleated',
#   brand: Brand.all.sample,
#   category: Category.all.sample,
#   average_fit: [*(1..10)].sample,
#   description: Faker::Lorem.sentences(5).join(' '),
#   user: User.all.sample

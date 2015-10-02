Brand.delete_all
Category.delete_all
Product.delete_all
Review.delete_all
User.delete_all
Vote.delete_all

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
  'Pants', 'Casual Shirts', 'Jackets',
  'Shorts', 'Swimwear'
]

#'Dress Shirts', 'Shoes', 'Outerwear', 'Hats',
#'Sweaters', 'Athletic Wear', 'Sporting Goods'

categories.each do |category|
  Category.create(name: category)
end

brand = Brand.create(name: 'Patagonia')

# Pants

category = Category.find_by(name: 'Pants')
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
  count += 1
end

# Casual Shirts

category = Category.find_by(name: 'Casual Shirts')
titles = [
  "PATAGONIA MEN'S PERFORMANCE PIQUÉ POLO SHIRT",
  "PATAGONIA MEN'S PATALOHA® SHIRT",
  "PATAGONIA MEN'S LONG-SLEEVED A/C® STEERSMAN SHIRT"
]
urls = [
  'http://www.patagonia.com/tsimages/11788_155.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive',
  'http://www.patagonia.com/tsimages/52573_KEPB.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive',
  'http://www.patagonia.com/tsimages/53832_PGSB.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive'
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
  count += 1
end

# Shorts

category = Category.find_by(name: 'Shorts')
titles = [
  "PATAGONIA MEN'S ALL-WEAR SHORTS",
  "PATAGONIA MEN'S COTTON MINIMALIST WAVEFARER® BOARD SHORTS",
  "PATAGONIA MEN'S QUANDARY SHORTS"
]
urls = [
  'http://www.patagonia.com/tsimages/57675_EMRD.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive',
  'http://www.patagonia.com/tsimages/86576_HQRI.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive',
  'http://www.patagonia.com/tsimages/57825_ELKH.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive'
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
  count += 1
end

# Swimwear

category = Category.find_by(name: 'Swimwear')
titles = [
  "PATAGONIA WOMEN'S EIRON TANKINI",
  "PATAGONIA WOMEN'S R1® WETSUIT VEST",
  "PATAGONIA WOMEN'S WAVEFARER® BOARD SHORTS"
]
urls = [
  'http://www.patagonia.com/tsimages/77215_BFSP.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive',
  'http://www.patagonia.com/tsimages/87446_IKP.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive',
  'http://www.patagonia.com/tsimages/76595_311.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive'
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
  count += 1
end

#Jackets

category = Category.find_by(name: 'Jackets')
titles = [
  "PATAGONIA WOMEN'S LIGHTWEIGHT SYNCHILLA® SNAP-T® FLEECE PULLOVER",
  "PATAGONIA M'S SYNCHILLA® SNAP-T® FLEECE PULLOVER",
  "PATAGONIA MEN'S NANO PUFF® HOODY "
]
urls = [
  'http://www.patagonia.com/tsimages/25455_MOBK.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive',
  'http://www.patagonia.com/tsimages/25450_CUDB.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive',
  'http://www.patagonia.com/tsimages/84221_PSS.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive'
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
  count += 1
end

#####SEEEDING FOR JACK WILLS BEGINS HERE ######################################3

brand = Brand.create(name: 'Jack Wills')

# Pants

category = Category.find_by(name: 'Pants')
titles = [
  'BARBERRY SLIM CHINO',
  'BUCKINGHAM WOOL SUIT TROUSER',
  'RICKESTON UTILITY TROUSER'
]
urls = [
  'http://demandware.edgesuite.net/aati_prd/on/demandware.static/-/Sites-master_catalog/default/dw73c98255/ProductImages/10000919004.jpg',
  'http://demandware.edgesuite.net/aati_prd/on/demandware.static/-/Sites-master_catalog/default/dwdf83bf74/ProductImages/10000838402.jpg',
  'http://demandware.edgesuite.net/aati_prd/on/demandware.static/-/Sites-master_catalog/default/dwfc3db9d2/ProductImages/10000810301.jpg'
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
  count += 1
end

#Casual Shirts

category = Category.find_by(name: 'Casual Shirts')
titles = [
  "SALCOMBE LIGHT WEIGHT FLANNEL SHIRT",
  "SALCOMBE PRINT SHIRT",
  "SALCOMBE CHECK POPLIN SHIRT"
]
urls = [
  'http://demandware.edgesuite.net/aati_prd/on/demandware.static/-/Sites-master_catalog/default/dw319c444d/ProductImages/10000810809.jpg',
  'http://demandware.edgesuite.net/aati_prd/on/demandware.static/-/Sites-master_catalog/default/dw0ba82aa8/ProductImages/10000812302.jpg',
  'http://demandware.edgesuite.net/aati_prd/on/demandware.static/-/Sites-master_catalog/default/dwed717292/ProductImages/10000812101.jpg'
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
  count += 1
end

# Shorts

category = Category.find_by(name: 'Shorts')
titles = [
  "HODGKIN REGULAR FIT SWEATSHORTS"

]
urls = [
  'http://demandware.edgesuite.net/aati_prd/on/demandware.static/-/Sites-master_catalog/default/dwc81fbd2c/ProductImages/10000809201.jpg'
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
  count += 1
end

# # Swimwear
#
# category = Category.find_by(name: 'Swimwear')
# titles = [
#   "PATAGONIA WOMEN'S EIRON TANKINI",
#   "PATAGONIA WOMEN'S R1® WETSUIT VEST",
#   "PATAGONIA WOMEN'S WAVEFARER® BOARD SHORTS"
# ]
# urls = [
#   'http://www.patagonia.com/tsimages/77215_BFSP.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive',
#   'http://www.patagonia.com/tsimages/87446_IKP.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive',
#   'http://www.patagonia.com/tsimages/76595_311.fpx?wid=750&hei=750&bgcolor=FFFFFF&ftr=6&cvt=jpeg,scans=progressive'
# ]
#
# count = 0
# titles.each do |title|
#   Product.create(
#     title: title,
#     brand: brand,
#     category: category,
#     user: User.all.sample,
#     image_url: urls[count]
#   )
#   count += 1
# end
#

# #Jackets

category = Category.find_by(name: 'Jackets')
titles = [
  "LESTERTON BOMBER",
  "BELGRAVE BLAZER",
  "JACOBSTOWE JACKET"
]
urls = [
  'http://demandware.edgesuite.net/aati_prd/on/demandware.static/-/Sites-master_catalog/default/dw76f89c5d/ProductImages/10000809401.jpg',
  'http://demandware.edgesuite.net/aati_prd/on/demandware.static/-/Sites-master_catalog/default/dwc5d82eb2/ProductImages/10000837004.jpg',
  'http://demandware.edgesuite.net/aati_prd/on/demandware.static/-/Sites-master_catalog/default/dw75d993c3/ProductImages/10000808103.jpg'
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
  count += 1
end

#######Seed Reviews For Products####################################

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

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include Faker
puts Name.name
puts Name.first_name
puts Name.last_name
puts Name.title
=begin
Restaurant.destroy_all

100.times do
  restaurant = Restaurant.create(
    name: Company.name,
    location: Address.city,
    cuisine: Food.dish,
    low_price_range: rand(1..5),
    high_price_range: rand(10..70),
    image: Placeholdit.image("#{rand(50..100)}x#{rand(50..100)}")
)
  restaurant.reviews.create(
    name: Name.first_name,
    review_text: Lorem.paragraph,
    rating: rand(1..5)

  )
  puts restaurant.inspect
end
=end
Product.destroy_all
100.times do
  product = Product.create(
      name: Commerce.product_name,
      description: Lorem.sentence,
      quantity_on_hand: rand(1..100),
      selling_price: Commerce.price,
      cost_of_product: Commerce.price,
      shipping_weight: rand(1..100),
      thumbnail: Placeholdit.image("#{rand(25..50)}x#{rand(25..50)}"),
      image: Placeholdit.image("#{rand(50..100)}x#{rand(50..100)}")
  )
  rand(1..10).times do
    product.product_reviews.create(
        name: Name.first_name,
        review_text: Lorem.paragraph,
        rating: rand(1..10)
    )
  end

  rand(1..10).times do
    product.articles.create(
        title: Name.title,
        author: Name.name,
        content: Lorem.paragraph,
        thumbnail: Placeholdit.image("#{rand(50..100)}x#{rand(50..100)}")
  )
  end
  puts product.inspect
end


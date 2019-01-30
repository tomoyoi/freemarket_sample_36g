# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
     Item.create(
        name: Faker::Book.title,
        images_attributes: [image: "https://4.bp.blogspot.com/-2t-ECy35d50/UPzH73UAg3I/AAAAAAAAKz4/OJZ0yCVaRbU/s1600/book.png"],
        price: 600,
        description: "goood!",
        delivery_fee: Faker::Boolean.boolean,
        area: Faker::Boolean.boolean,
        size: Faker::Boolean.boolean,
      )
end

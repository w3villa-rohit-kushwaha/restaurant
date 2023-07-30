# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Clear previous data
User.destroy_all
Restaurant.destroy_all
Review.destroy_all # Add this line to clear all reviews

# seed.rb

# Create an admin user
admin_user = User.create(email: 'admin@example.com', password: 'password', admin: true)

# Create some normal users
user1 = User.create(email: 'user1@example.com', password: 'password')
user2 = User.create(email: 'user2@example.com', password: 'password')

# Create some restaurants
restaurant1 = Restaurant.create(name: 'Restaurant One', status: 'Open')
restaurant2 = Restaurant.create(name: 'Restaurant Two', status: 'Closed')
restaurant3 = Restaurant.create(name: 'Restaurant Three', status: 'Open')
restaurant4 = Restaurant.create(name: 'Restaurant Four', status: 'Open')
restaurant5 = Restaurant.create(name: 'Restaurant Five', status: 'Closed')

# Create some dishes for each restaurant
dish1 = restaurant1.dishes.create(name: 'Dish One for Restaurant One')
dish2 = restaurant1.dishes.create(name: 'Dish Two for Restaurant One')
dish3 = restaurant1.dishes.create(name: 'Dish Three for Restaurant One')
dish4 = restaurant1.dishes.create(name: 'Dish Four for Restaurant One')
dish5 = restaurant1.dishes.create(name: 'Dish Five for Restaurant One')

dish6 = restaurant2.dishes.create(name: 'Dish One for Restaurant Two')
dish7 = restaurant2.dishes.create(name: 'Dish Two for Restaurant Two')
dish8 = restaurant2.dishes.create(name: 'Dish Three for Restaurant Two')
dish9 = restaurant2.dishes.create(name: 'Dish Four for Restaurant Two')
dish10 = restaurant2.dishes.create(name: 'Dish Five for Restaurant Two')

dish11 = restaurant3.dishes.create(name: 'Dish One for Restaurant Three')
dish12 = restaurant3.dishes.create(name: 'Dish Two for Restaurant Three')
dish13 = restaurant3.dishes.create(name: 'Dish Three for Restaurant Three')
dish14 = restaurant3.dishes.create(name: 'Dish Four for Restaurant Three')
dish15 = restaurant3.dishes.create(name: 'Dish Five for Restaurant Three')

dish16 = restaurant4.dishes.create(name: 'Dish One for Restaurant Four')
dish17 = restaurant4.dishes.create(name: 'Dish Two for Restaurant Four')
dish18 = restaurant4.dishes.create(name: 'Dish Three for Restaurant Four')
dish19 = restaurant4.dishes.create(name: 'Dish Four for Restaurant Four')
dish20 = restaurant4.dishes.create(name: 'Dish Five for Restaurant Four')

dish21 = restaurant5.dishes.create(name: 'Dish One for Restaurant Five')
dish22 = restaurant5.dishes.create(name: 'Dish Two for Restaurant Five')
dish23 = restaurant5.dishes.create(name: 'Dish Three for Restaurant Five')
dish24 = restaurant5.dishes.create(name: 'Dish Four for Restaurant Five')
dish25 = restaurant5.dishes.create(name: 'Dish Five for Restaurant Five')

# Create some reviews for restaurants
Review.create(content: 'Great restaurant!', rating: 5, reviewable: restaurant1, user: user1)
Review.create(content: 'Nice ambiance!', rating: 4, reviewable: restaurant2, user: user2)
Review.create(content: 'Delicious food!', rating: 5, reviewable: restaurant3, user: user1)
Review.create(content: 'Amazing service!', rating: 5, reviewable: restaurant4, user: user2)
Review.create(content: 'Good experience!', rating: 4, reviewable: restaurant5, user: user1)

# Create some reviews for dishes
Review.create(content: 'Delicious dish!', rating: 5, reviewable: dish1, user: user1)
Review.create(content: 'Tasty!', rating: 4, reviewable: dish2, user: user2)
Review.create(content: 'Good flavor!', rating: 4, reviewable: dish3, user: user1)
Review.create(content: 'Decent dish!', rating: 3, reviewable: dish4, user: user2)
Review.create(content: 'Yummy!', rating: 5, reviewable: dish5, user: user1)

# Add more reviews for dishes
Review.create(content: 'Tasty and flavorful!', rating: 5, reviewable: dish6, user: user2)
Review.create(content: 'Nice presentation!', rating: 4, reviewable: dish7, user: user1)
Review.create(content: 'Delicious and filling!', rating: 5, reviewable: dish8, user: user2)
Review.create(content: 'Good portion size!', rating: 4, reviewable: dish9, user: user1)
Review.create(content: 'Enjoyed it!', rating: 4, reviewable: dish10, user: user2)

Review.create(content: 'Excellent dish!', rating: 5, reviewable: dish11, user: user1)
Review.create(content: 'Must try!', rating: 5, reviewable: dish12, user: user2)
Review.create(content: 'Perfectly cooked!', rating: 5, reviewable: dish13, user: user1)
Review.create(content: 'Delightful!', rating: 4, reviewable: dish14, user: user2)
Review.create(content: 'Satisfying!', rating: 4, reviewable: dish15, user: user1)

Review.create(content: 'Superb dish!', rating: 5, reviewable: dish16, user: user2)
Review.create(content: 'Flavorful!', rating: 4, reviewable: dish17, user: user1)
Review.create(content: 'Delicious and unique!', rating: 5, reviewable: dish18, user: user2)
Review.create(content: 'Loved it!', rating: 4, reviewable: dish19, user: user1)
Review.create(content: 'Great taste!', rating: 4, reviewable: dish20, user: user2)

Review.create(content: 'Good dish!', rating: 3, reviewable: dish21, user: user1)
Review.create(content: 'Decent flavor!', rating: 3, reviewable: dish22, user: user2)
Review.create(content: 'Average taste!', rating: 3, reviewable: dish23, user: user1)
Review.create(content: 'Nothing special!', rating: 2, reviewable: dish24, user: user2)
Review.create(content: 'Not impressed!', rating: 2, reviewable: dish25, user: user1)

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


https://github.com/w3villa-rohit-kushwaha/restaurant/assets/124652468/7ed7e0e8-c03c-4d42-9b21-55f7e4ec4402


Restaurant App is a web application built with Ruby on Rails that allows users to browse and review restaurants and their dishes.

## Features

- User authentication: Sign up, log in, and log out functionality with Devise gem.
- Background jobs: Utilizes Sidekiq for handling asynchronous tasks like email notifications or other time-consuming processes.
- Restaurants: View a list of restaurants and their details.
- Dishes: Explore the menu and details of dishes available at each restaurant.
- Reviews: Users can leave reviews and ratings for restaurants and dishes.

username and pass-words::

# Create an admin user
admin_user = User.create(email: 'admin@example.com', password: 'password', admin: true)

# Create some normal users
user1 = User.create(email: 'user1@example.com', password: 'password')
user2 = User.create(email: 'user2@example.com', password: 'password')

